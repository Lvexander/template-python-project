# Data Project Template

![Static Badge](https://img.shields.io/badge/Project%20Template-python-yellow?style=plastic)


## Cookiecutter Data Science
This project template is a simplified version of the [Cookiecutter Data Science](https://cookiecutter-data-science.drivendata.org) template.


## Duplicating the .env File
To set up your environment variables, you need to duplicate the `.env.example` file and rename it to `.env`. You can do this manually or using the following terminal command:

```bash
cp .env.example .env # Linux, macOS, Git Bash, WSL
copy .env.example .env # Windows Command Prompt
```

This command creates a copy of `.env.example` and names it `.env`, allowing you to configure your environment variables specific to your setup.


## Project Organization

```
├── configs            <- Yaml configuration files
│
├── data
│   ├── external       <- Data from third party sources
│   ├── interim        <- Intermediate data that has been transformed
│   ├── processed      <- The final, canonical data sets for modeling
│   └── raw            <- The original, immutable data dump
│
├── docs               <- Documentation and references for the project
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks for exploration and analysis
│                         Naming convention: number (for ordering), creator's initials,
│                         and a short `-` delimited description, e.g., `1.0-jqp-initial-data-exploration`
│
├── references         <- Data dictionaries, manuals, and explanatory materials
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures for reports
│
├── scripts            <- Standalone scripts for various tasks
│
└── src                         <- Source code for the project
    │
    ├── __init__.py             <- Makes `src` a Python module
    │
    ├── module                  <- Project module       
    │   ├── __init__.py
    │
    └── util                    <- Utility functions and helpers     
        └── __init__.py
│
├── .env.example       <- Example environment variables file
│
├── Dockerfile         <- Dockerfile for containerizing the project
│
├── README.md          <- The top-level README file for developers using this project
│
├── requirements.txt   <- List of dependencies for reproducing the environment, generated with
│                         `pip freeze > requirements.txt`
│
├── ruff.toml          <- Configuration file for the Ruff linter

```

--------