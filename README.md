# 复旦大学经济学院研究生学位论文 LaTeX 模板
# Fudan School of Economics (FDSE) Thesis LaTeX Template

[![Open in Overleaf](https://img.shields.io/badge/Overleaf-Open%20in%20Overleaf-green)](https://www.overleaf.com/docs?snip_uri=https://github.com/yqhphoebe/FudanSOE-thesis-template/archive/main.zip)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## 基于《复旦大学经济学院博士、硕士研究生学位论文撰写规范（2019年10月修订版）》制作的 LaTeX 模板。


## 说明 

注：github直接用overleaf打开的话，记得将compiler改为XeLaTex，直接用默认编译器可能无法编译

### 1. 字体设置 

* Windows / Overleaf: 模板默认配置即可直接运行（使用 Windows 自带字体或 Fandol 字体）。
* macOS: 请打开 `fdse.cls` 文件，找到字体设置部分，按照注释开启 macOS 字体配置：
    ```latex
    % macOS 用户请启用以下设置：
    \setCJKmainfont[AutoFakeBold=true]{Songti SC}
    \setCJKsansfont[AutoFakeBold=true]{Heiti SC}
    ```

### 2. 参考文献 (Bibliography)

在 `reference.bib` 中添加文献时，**中文文献必须添加 `langid = {chinese}` 字段**，以便模板将其自动归类到中文列表并按拼音排序。

```bibtex
@article{xu2010,
  author  = {某},
  title   = {标题示例},
  journal = {经济研究},
  year    = {2010},
  langid  = {chinese}  % <--- 关键字段
}
