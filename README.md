# AI-Travel-Planner
# ✈️ AI Travel Planner — Advanced Agentic AI System Engineering

An autonomous end-to-end multi-agent travel planning system built using LangGraph and LangChain. The system processes complex user travel queries, conducts automated research, validates budget limits, enforces security guardrails, and dynamically re-plans itinerary tiers via stateful graph loops.

---

## 👥 Team Responsibilities & Architecture

This capstone project integrates all course deliverables:

* Noura Alfaadhel — AI/Agent Lead: ReAct reasoning implementation and tool integration (Tavily Search).
* Ghala Alamri — Graph-Based Orchestration: LangGraph StateGraph workflow, conditional routing, budget validation, and replanner retry loops.
*  Sarah Al-Sa'ed — Multi-Agent System & Role Specialization: Specialized agent roles (Planner, Researcher, Budget Reviewer) and structured message passing.
* Ghaida Alwasel — Security, Guardrails & DevOps: Input prompt-injection protection, output validation, logging, state persistence, and HITL nodes.
* Joud Aldawsari — Documentation & Integration Lead: Pipeline execution logs, integration testing, and final reports.

---

## 🛠️ Integrated Workflow Architecture

1. Input Guardrail: Scans user queries for prompt injection or safety violations.
2. Planner Agent: Deconstructs the request into structured sub-tasks.
3. ReAct Researcher Node: Uses Tavily search tools to fetch real-time weather, attractions, and initial cost estimates.
4. Budget Check Node: Validates financial constraints ($2000 max budget rule).
5. Replanner Retry Loop: Automatically routes over-budget execution states back for tier optimization.
6. Synthesizer & Output Guardrail: Compiles the finalized 4-day structured itinerary.

---

## 🚀 How to Run

1. Open the notebook in Google Colab.
2. Add your API Keys (`GEMINI_API_KEY`, `TAVILY_API_KEY`) under Colab Secrets (🔑).
3. Select Runtime -> Run all.

---

## 🎓 Program Attribution

* Program: Advanced Agentic AI Systems Engineering
* Session date :2 Aug 2026 - 6 Aug 2026
* Trainer :Mohammed Albelad
* Supervisor : Dr.Sultan AlSarraa
* Delivered via: SDAIA Academy & Learning Space
* GitHub Reference: [SDAIA Academy on GitHub](https://github.com/SDAIAAcademy)


