# Local LLM Character Scripts

## Overview
This repository provides a collection of shell scripts to interact with locally running large language models (LLMs) through different character personas. Each character has a unique personality and response style, allowing for varied interactions with the same underlying model.

## Features
- Multiple character personas (Marvin, Gandalf, Yoda, Sherlock, Tony Stark)
- Support for different LLM models (gemma-3-1b-it, gemma-3-27b-it, qwen2.5-coder-14b-instruct, deepseek-r1-distill-qwen-32b)
- Automatic context length configuration based on the selected model
- Simple command-line interface

## Requirements
- Linux/Unix-based system
- `lms` command-line tool for loading and managing local LLM models
- Bash shell

## Installation
1. Clone this repository to your local machine
2. Ensure all scripts have executable permissions:
   ```bash
   chmod +x *.sh
   ```

## Usage

### Loading a Model
Before using the character scripts, you need to load a model:
```bash
./load_model.sh
```
This will prompt you to select a model from the available options. The script automatically configures the appropriate context length for each model.

### Character Interaction
You can interact with individual characters:
```bash
./marvin.sh "Tell me about artificial intelligence"
./gandalf.sh "What is the nature of power?"
./yoda.sh "How to become a Jedi?"
./sherlock.sh "Solve this mystery for me"
./tony_stark.sh "Design a new technology"
```

### All Characters at Once
To get responses from all characters for the same prompt:
```bash
./all.sh "What is the meaning of life?"
```
This will display responses from each character (limited to the first 3 lines per character).

## Character Descriptions
- **🧠 Marvin**: Depressive robot with a pessimistic outlook
- **🧙 Gandalf**: Wise wizard with deep philosophical insights
- **🟢 Yoda**: Speaks in inverted syntax with wisdom about the Force
- **🕵️ Sherlock**: Analytical detective with deductive reasoning
- **🤖 Tony Stark**: Genius inventor with a sarcastic attitude

## Customization
You can create additional character scripts following the pattern of the existing ones. Each character script should define the persona and interaction style before calling the underlying LLM.

## Model Information
The script supports various models with different context lengths. The context length is automatically configured based on the selected model.
