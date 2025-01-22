# cli AI

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
```

## piper-tts

Fast, local neural text to speech system.
[github](https://github.com/rhasspy/piper)

```nix tangle:default.nix
      "piper-tts"
```

## tgpt

ChatGPT in terminal without needing API keys.
[github](https://github.com/aandrew-me/tgpt)
`$ tgpt --help`

```
Usage: tgpt [Flags] [Prompt]

Flags:
-s, --shell                                        Generate and Execute shell commands. (Experimental)
-c, --code                                         Generate Code. (Experimental)
-q, --quiet                                        Gives response back without loading animation
-w, --whole                                        Gives response back as a whole text
-img, --image                                      Generate images from text
--provider                                         Set Provider. Detailed information has been provided below. (Env: AI_PROVIDER)

Some additional options can be set. However not all options are supported by all providers. Not supported options will just be ignored.
--model                                            Set Model
--key                                              Set API Key
--url                                              Set OpenAI API endpoint url
--temperature                                      Set temperature
--top_p                                            Set top_p
--max_length                                       Set max response length

Options:
-v, --version                                      Print version
-h, --help                                         Print help message
-i, --interactive                                  Start normal interactive mode
-m, --multiline                                    Start multi-line interactive mode
-cl, --changelog                                   See changelog of versions
-u, --update                                       Update program

Providers:
The default provider is phind. The AI_PROVIDER environment variable can be used to specify a different provider.
Available providers to use: openai, opengpts, koboldai, phind, blackboxai, ollama and groq

Provider: openai
Needs API key to work and supports various models. Recognizes the OPENAI_API_KEY and OPENAI_MODEL environment variables.

Provider: opengpts
Uses gpt-3.5-turbo only. Do not use with sensitive data

Provider: koboldai
Uses koboldcpp/HF_SPACE_Tiefighter-13B only, answers from novels

Provider: phind
Uses Phind Model. Great for developers

Provider: blackboxai
Uses BlackBox model. Great for developers

Provider: ollama
Needs to be run locally. Supports many models

Provider: groq
Requires a free API Key. Supports LLaMA2-70b & Mixtral-8x7b

Examples:
tgpt "What is internet?"
tgpt -m
tgpt -s "How to update my system?"
tgpt --provider opengpts "What is 1+1"
tgpt --provider openai --key "sk-xxxx" --model "gpt-3.5-turbo" "What is 1+1"
cat install.sh | tgpt "Explain the code"
```

```nix tangle:default.nix
      "tgpt"
      # keep-sorted end
    ];
```

## aichat

Use GPT-4(V), Gemini, LocalAI, Ollama and other LLMs in the terminal.
[github](https://github.com/sigoden/aichat)
`$ aichat --help`

```
All-in-one LLM CLI Tool

Usage: aichat [OPTIONS] [TEXT]...

Arguments:
  [TEXT]...  Input text

Options:
  -m, --model <MODEL>        Select a LLM model
      --prompt <PROMPT>      Use the system prompt
  -r, --role <ROLE>          Select a role
  -s, --session [<SESSION>]  Start or join a session
      --empty-session        Ensure the session is empty
      --save-session         Force the session to be saved
  -a, --agent <AGENT>        Start a agent
  -R, --rag <RAG>            Start a RAG
      --serve [<ADDRESS>]    Serve the LLM API and WebAPP
  -e, --execute              Execute commands in natural language
  -c, --code                 Output code only
  -f, --file <FILE>          Include files with the message
  -S, --no-stream            Turn off stream mode
      --dry-run              Display the message without sending it
      --info                 Display information
      --list-models          List all available chat models
      --list-roles           List all roles
      --list-sessions        List all sessions
      --list-agents          List all agents
      --list-rags            List all RAGs
  -h, --help                 Print help
  -V, --version              Print version
```

```nix tangle:default.nix
    enable = "aichat";
  }
)
```
