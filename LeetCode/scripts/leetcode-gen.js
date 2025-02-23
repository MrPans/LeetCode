#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { program } = require('commander');
const axios = require('axios');

// 配置命令行参数
program
    .argument('<number>', 'LeetCode problem number')
    .parse(process.argv);

const problemNumber = program.args[0];
const username = process.env.USER || process.env.USERNAME;

// LeetCode API
const LEETCODE_API = 'https://leetcode.com/api';

// 获取题目信息
async function fetchProblemInfo(number) {
    try {
        // 获取所有题目列表
        const response = await axios.get(`${LEETCODE_API}/problems/all/`);
        
        if (!response.data || !response.data.stat_status_pairs) {
            throw new Error('Invalid response from LeetCode API');
        }

        // 找到对应题号的题目
        const problem = response.data.stat_status_pairs.find(
            p => p.stat.frontend_question_id.toString() === number.toString()
        );

        if (!problem) {
            throw new Error(`Problem #${number} not found`);
        }

        // 获取题目详情
        const titleSlug = problem.stat.question__title_slug;
        const graphqlResponse = await axios.post('https://leetcode.com/graphql', {
            query: `
                query questionData($titleSlug: String!) {
                    question(titleSlug: $titleSlug) {
                        questionId
                        title
                        content
                        codeDefinition
                        sampleTestCase
                    }
                }
            `,
            variables: { titleSlug }
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Referer': 'https://leetcode.com'
            }
        });

        const questionData = graphqlResponse.data.data.question;
        return {
            title: problem.stat.question__title,
            titleSlug,
            content: questionData.content,
            codeDefinition: questionData.codeDefinition ? JSON.parse(questionData.codeDefinition) : [],
            sampleTestCase: questionData.sampleTestCase
        };
    } catch (error) {
        if (error.response) {
            console.error('API Error:', error.response.status, error.response.data);
        }
        throw error;
    }
}

// 从代码定义中提取 Swift 函数模板
function extractSwiftTemplate(codeDefinition) {
    const swiftDef = codeDefinition.find(def => def.value === 'swift');
    if (!swiftDef) {
        return '    // TODO: Implement your solution here';
    }

    // 从代码中提取方法定义
    const code = swiftDef.defaultCode;
    const methodMatch = code.match(/func\s+\w+\s*\([^)]*\)\s*->\s*[^{]+/);
    
    if (!methodMatch) {
        return '    // TODO: Implement your solution here';
    }

    // 返回方法定义和基本实现
    return `    ${methodMatch[0]} {
        // TODO: Implement your solution here
        ${code.includes('return') ? 'return nil' : ''}
    }`;
}

// 生成测试用例代码
function generateTestCase(sampleTestCase, methodMatch) {
    if (!sampleTestCase || !methodMatch) {
        return '    // TODO: Add test cases';
    }

    // 解析方法签名
    const methodSignature = methodMatch[0];
    const methodName = methodSignature.match(/func\s+(\w+)/)[1];
    const returnType = methodSignature.match(/->\s*([^{]+)/)[1].trim();
    
    // 解析参数
    const paramsMatch = methodSignature.match(/\((.*?)\)/);
    const params = paramsMatch ? paramsMatch[1].split(',').map(param => {
        const [name, type] = param.trim().split(':').map(s => s.trim());
        return { name: name.replace('_', ''), type: type };
    }) : [];
    
    // 处理测试用例
    const testCases = sampleTestCase.split('\n').filter(line => line.trim());
    
    let testCode = '    // Test cases from LeetCode:\n';
    testCases.forEach((testCase, index) => {
        // 移除方括号并分割数组
        const values = testCase.replace(/[\[\]]/g, '').split(',');
        
        if (params.length === 1 && params[0].type.includes('ListNode')) {
            // 单参数链表相关的测试用例
            testCode += `    let testCase${index} = ListNode([${values.join(',')}])\n`;
            testCode += `    let result${index} = ${methodName}(testCase${index})\n`;
            testCode += `    print(result${index})\n\n`;
        } else if (params.length === 2 && params[0].type.includes('ListNode')) {
            // 双参数链表相关的测试用例（如 removeElements）
            testCode += `    let head${index} = ListNode([${values[0]}])\n`;
            testCode += `    let result${index} = ${methodName}(head${index}, ${values[1]})\n`;
            testCode += `    print(result${index})\n\n`;
        } else if (params.some(p => p.type.includes('inout'))) {
            // 数组相关的测试用例
            testCode += `    var testArray${index} = [${values.join(',')}]\n`;
            testCode += `    ${methodName}(&testArray${index})\n`;
            testCode += `    print(testArray${index})\n\n`;
        } else if (params.length > 1) {
            // 多参数的测试用例
            const args = values.map((val, i) => {
                if (params[i].type.includes('Int')) return val;
                if (params[i].type.includes('String')) return `"${val}"`;
                return val;
            }).join(', ');
            testCode += `    let result${index} = ${methodName}(${args})\n`;
            testCode += `    print(result${index})\n\n`;
        } else {
            // 其他类型的测试用例
            testCode += `    let result${index} = ${methodName}(${values[0]})\n`;
            testCode += `    print(result${index})\n\n`;
        }
    });
    
    return testCode;
}

// 生成文件内容
async function generateFileContent(number) {
    // 读取模板文件
    const templatePath = path.join(__dirname, 'templates', 'solution.swift');
    let template = fs.readFileSync(templatePath, 'utf8');

    // 获取题目信息
    const problemInfo = await fetchProblemInfo(number);
    
    // 获取当前日期
    const now = new Date();
    const dateStr = now.toISOString().split('T')[0];
    const year = now.getFullYear();

    // 从代码中提取方法定义
    const code = problemInfo.codeDefinition.find(def => def.value === 'swift')?.defaultCode;
    const methodMatch = code ? code.match(/func\s+\w+\s*\([^)]*\)\s*->\s*[^{]+/) : null;

    // 生成解决方案模板
    const solutionTemplate = extractSwiftTemplate(problemInfo.codeDefinition);
    
    // 生成测试用例代码
    const testCode = generateTestCase(problemInfo.sampleTestCase, methodMatch);

    // 替换模板变量
    const replacements = {
        '{NUMBER}': number,
        '{USER}': username,
        '{DATE}': dateStr,
        '{YEAR}': year,
        '{URL}': `https://leetcode.com/problems/${problemInfo.titleSlug}/`,
        '{SOLUTION_PLACEHOLDER}': solutionTemplate,
        '{TEST_PLACEHOLDER}': testCode
    };

    Object.entries(replacements).forEach(([key, value]) => {
        template = template.replace(new RegExp(key, 'g'), value);
    });

    return template;
}

// 主函数
async function main() {
    try {
        // 生成文件内容
        const content = await generateFileContent(problemNumber);

        // 确定文件路径
        const fileName = `LeetCode_${problemNumber}.swift`;
        const filePath = path.join(__dirname, '..', 'LeetCode', fileName);

        // 检查文件是否已存在
        if (fs.existsSync(filePath)) {
            console.error(`Error: File ${fileName} already exists`);
            process.exit(1);
        }

        // 写入文件
        fs.writeFileSync(filePath, content);
        console.log(`Successfully created ${fileName}`);
        
    } catch (error) {
        console.error('Error:', error.message);
        process.exit(1);
    }
}

main(); 