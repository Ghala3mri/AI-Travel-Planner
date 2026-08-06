# Technical Documentation
## AI Travel Planner – Advanced Agentic AI System

---

# 1. System Overview

The AI Travel Planner is an agentic AI application that generates personalized travel itineraries based on user preferences such as destination, budget, and travel duration.

The system uses a LangGraph-based workflow composed of multiple nodes representing different stages of reasoning and execution. It integrates Large Language Models (LLMs), Retrieval-Augmented Generation (RAG), and Human-in-the-Loop (HITL) approval to produce reliable travel plans.

---

# 2. Architecture

The system follows a graph-based architecture implemented with LangGraph.

```
            User Request
                  │
                  ▼
        Planner / ReAct Agent
                  │
                  ▼
        Retrieve Travel Knowledge
                  │
                  ▼
      Generate Travel Itinerary
                  │
                  ▼
      Human Approval (HITL)
          │             │
   Approved         Rejected
      │                 │
      ▼                 ▼
 Booking Simulation   Cancel Request
      │
      ▼
     End
```

---

# 3. Graph Nodes

## Node 1 — Planner Agent

**Purpose**

Receives the user's travel request and creates an initial travel itinerary.

**Input**

- Destination
- Budget
- Duration

**Output**

- Draft itinerary

---

## Node 2 — Retrieval (RAG)

**Purpose**

Retrieves travel-related information from the vector database to improve itinerary quality.

**Technologies**

- ChromaDB
- Embedding Model

---

## Node 3 — Human-in-the-Loop (HITL)

**Purpose**

Pauses workflow execution and requests human approval before continuing.

Implemented using:

- LangGraph Interrupt
- Command Resume

Possible outcomes:

- APPROVED
- REJECTED

---

## Node 4 — Booking Simulation

Executed only after approval.

Simulates:

- Flight booking
- Hotel booking
- Confirmation generation

---

## Node 5 — Cancellation

Executed when the itinerary is rejected.

Terminates the workflow safely.

---

# 4. State Management

The application stores workflow state using LangGraph checkpoints.

State variables include:

- user_query
- generated_itinerary
- approval_status
- final_result

Checkpoint persistence is implemented using SQLite.

Database:

```
travel_planner_checkpoint.db
```

This allows interrupted executions to resume without losing progress.

---

# 5. Human-in-the-Loop Workflow

The workflow pauses execution using LangGraph's interrupt() function.

The user reviews the itinerary and chooses one of two actions:

- Approve
- Reject

The graph resumes using:

```
Command(resume="approve")
```

or

```
Command(resume="reject")
```

---

# 6. Technologies Used

| Component | Technology |
|------------|------------|
| Workflow Engine | LangGraph |
| LLM Framework | LangChain |
| Vector Database | ChromaDB |
| Programming Language | Python |
| Notebook Environment | Google Colab |
| Persistence | SQLite |
| Version Control | GitHub |
| Deployment Artifact | Docker |

---

# 7. Project Structure

```
AI-Travel-Planner/

│── project.ipynb
│── README.md
│── Technical_Document.md
│── Dockerfile
│── docker-compose.yml
│── requirements.txt
│── travel_planner_checkpoint.db
```

---

# 8. Deployment

The repository includes production deployment artifacts.

Files:

- Dockerfile
- docker-compose.yml
- requirements.txt

These enable containerized execution of the application.

---

# 9. Configuration

Required Python packages are listed in:

```
requirements.txt
```

Main libraries include:

- langgraph
- langchain
- chromadb
- openai
- google-generativeai
- pandas
- numpy

---

# 10. Execution Flow

1. User submits a travel request.
2. Planner Agent generates an itinerary.
3. RAG retrieves supporting travel information.
4. Workflow pauses for human approval.
5. User approves or rejects the itinerary.
6. Approved requests simulate booking.
7. Rejected requests terminate the workflow.
8. Workflow state is saved automatically using SQLite checkpoints.

---

# 11. Production Readiness

The project includes production-oriented features:

- Persistent SQLite checkpoints
- Human-in-the-Loop approval
- Docker deployment artifacts
- GitHub version control
- Modular graph architecture
- Reproducible environment using requirements.txt

---

# 12. Future Improvements

Potential enhancements include:

- Real flight and hotel booking APIs
- Live weather integration
- Google Maps support
- Multi-agent collaboration
- Cloud deployment on Azure or AWS
- Redis or PostgreSQL checkpoint storage
