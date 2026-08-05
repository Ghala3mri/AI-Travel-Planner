# Technical Documentation

# AI Travel Planner

## Project Overview

AI Travel Planner is a multi-agent AI system developed for the SDAIA Academy Advanced Agentic AI Systems Engineering Capstone. The system assists users in generating personalized travel plans by coordinating multiple AI agents through a graph-based workflow.

---

# Architecture

The application follows a graph-based architecture where multiple specialized agents collaborate using a shared state.

Workflow:

User Request
↓
Planner Agent


The workflow is orchestrated using LangGraph, allowing nodes to exchange information through a shared state object and enabling conditional transitions when required.

---

# Agents

## 1. Planner Agent

Responsibilities:

- Understand user requirements.
- Create an execution plan.
- Delegate tasks to the appropriate agents.

Input:
- User travel request.

Output:
- Structured travel plan.

---

## 2. Research Agent

Responsibilities:

- Retrieve destination-related information.
- Collect travel recommendations.
- Gather hotel and transportation details.

Input:
- Travel plan from Planner Agent.

Output:
- Structured travel information.

---

## 3. Recommendation Agent

Responsibilities:

- Combine collected information.
- Generate the final travel itinerary.
- Format the response.

Input:
- Research results.

Output:
- Personalized travel itinerary.

---

# Graph Components

## Nodes

- User Input
- Planner Agent
- Research Agent
- Recommendation Agent
- Security Guardrails
- Response Validator
- Final Output

## Edges

- User Input → Planner Agent
- Planner Agent → Research Agent
- Research Agent → Recommendation Agent
- Recommendation Agent → Guardrails
- Guardrails → Validator
- Validator → Final Output

Conditional edges are used to repeat or terminate execution based on validation results.

---

# Shared State

The system maintains a shared state containing:

- User request
- Destination
- Budget
- Travel dates
- Agent outputs
- Validation status
- Final itinerary

This state is updated throughout the workflow by each agent.

---

# Tools

The project integrates external tools and APIs to support travel planning, retrieve relevant information, and generate intelligent responses through Large Language Models.

---

# Security & Guardrails

The project includes:

- Input validation
- Prompt injection detection
- Output validation
- Logging and monitoring

These mechanisms improve system reliability and response quality.

---

# Observability

Execution events are logged to monitor:

- Agent execution
- Tool calls
- Processing steps
- Errors
- Workflow status

---

# Project Structure
AI-Travel-Planner/
│
├── app.py
├── requirements.txt
├── README.md
├── TECHNICAL_DOCUMENTATION.md
├── src/
├── data/
├── docs/
└── notebooks/

---

# Technologies

- Python
- LangGraph
- LangChain
- FastAPI
- SQLite
- OpenAI API

---

# Future Improvements

- Persistent workflow checkpointing.
- Human-in-the-loop approval.
- Cloud deployment using Docker.
- Additional travel service integrations.
- Enhanced monitoring and analytics.

---

# Training Program

Developed as part of:

SDAIA Academy – Advanced Agentic AI Systems Engineering Capstone
