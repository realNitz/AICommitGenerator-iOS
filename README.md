# AI Chat iOS App (SwiftUI + OpenRouter)

A simple AI Chat application built using **SwiftUI** that connects to
LLM models via **OpenRouter API**.\
This project is designed for **learning purposes and GitHub portfolio
showcase**.

## Features

-   Clean SwiftUI Chat Interface
-   Send prompts to AI models
-   Uses OpenRouter API
-   Loading indicator while waiting for response
-   Error handling for API failures
-   Pull to refresh support
-   MVVM architecture

## Tech Stack

-   Swift
-   SwiftUI
-   MVVM Architecture
-   URLSession for API calls
-   OpenRouter API

## Project Structure

    AIChatApp
    │
    ├── Models
    │   └── ChatMessage.swift
    │
    ├── ViewModels
    │   └── ChatViewModel.swift
    │
    ├── Views
    │   ├── ChatView.swift
    │   └── MessageBubble.swift
    │
    ├── Services
    │   └── APIService.swift
    │
    └── Resources

## Setup Instructions

### 1. Clone the Repository

``` bash
git clone https://github.com/yourusername/ai-chat-ios.git
cd ai-chat-ios
```

### 2. Add Your OpenRouter API Key

Open:

    APIService.swift

Replace:

    let apiKey = "YOUR_OPENROUTER_API_KEY"

with your key from:

https://openrouter.ai

### 3. Run the Project

1.  Open the project in **Xcode**
2.  Select **iPhone Simulator**
3.  Press **Run (⌘ + R)**

## Example API Request

    POST https://openrouter.ai/api/v1/chat/completions

Body:

``` json
{
  "model": "openai/gpt-3.5-turbo",
  "messages": [
    { "role": "user", "content": "Hello" }
  ]
}
```

## Screenshots

<img width="329" height="685" alt="Screenshot 2026-03-06 at 1 15 38 PM" src="https://github.com/user-attachments/assets/0a974cb6-a00d-4003-b5ee-bb028cc0d751" />

<img width="333" height="683" alt="Screenshot 2026-03-06 at 1 15 16 PM" src="https://github.com/user-attachments/assets/959782fc-5d42-4d29-9ae1-09ee46b6f662" />


## Future Improvements

-   Dark mode UI
-   Chat history storage
-   Multiple AI models
-   Voice input
-   Streaming responses

## Author

**Nitesh Parihar**\
iOS Developer (6+ years experience)

If you like this project, consider giving it a ⭐ on GitHub.
