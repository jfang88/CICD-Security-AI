# Open Decisions, Actions and Review Notes

Companion to [`01-architecture-option-pack.md`](01-architecture-option-pack.md). Everything here is something the pack deliberately left open, flagged as an assumption, or raised as a judgement call that needs a human owner.

Each item maps to a GitHub issue created by [`../scripts/publish.sh`](../scripts/publish.sh). Labels: `decision` (a choice must be made), `action` (work to schedule), `note` (a caveat to be aware of, no action required yet).

---

## Decisions — must be made before Phase 0 completes

| # | Decision | Why it's open | Blocks |
|---|---|---|---|
| D1 | Which architecture option: commercial-first, open-source-first, or hybrid | §7.4 scores hybrid highest (4.25) but on **my** weights, not yours. The weighting reflects assumptions about your platform team capacity, sovereignty obligations and existing licence estate that I don't have. | Everything in Phase 0 |
| D2 | Build vs buy for the agent control plane | §7.5 recommends build. That's the single largest engineering commitment in the pack and rests on the claim that no mature product exists. Worth testing against your own market scan before committing. | Phase 0 scope and funding |
| D3 | Which model providers are approved, for which data classifications | Depends entirely on your regulatory scope and residency obligations, which I've treated as an assumption (§6.6). If restricted classifications can't reach external providers, the agentic capability ceiling drops materially. | Model gateway design |
| D4 | Whether agentic discovery runs on open-source, commercial, or both in parallel | §7.3 recommends both, because two independent sources give genuine corroboration for the discovery/validation separation principle. It also doubles the normalisation burden. Real trade-off. | Phase 1 pilot design |
| D5 | Autonomy ceiling for the remediation plane | The pack caps everything at L2 (act, gated). Whether sustainment-class changes — dependency uplift, deprecated API migration — could justify L3 with monitoring and rollback is a defensible argument I chose not to make. | Phase 2 |
| D6 | Evidence retention periods per system class | §12.5 proposes 7 years minimum for regulated systems. That's a placeholder; your obligations are specific. | Evidence store design |
| D7 | Which repositories are in the Phase 1 pilot | §14.2 says high-value, high-exposure, strong existing coverage, clear ownership. Naming them is a decision only you can make. | Phase 1 start |

---

## Actions — schedulable work

| # | Action | Owner (proposed) | Timing | Notes |
|---|---|---|---|---|
| A1 | Run the platform readiness assessment against the ten conditions in §14.5 | Platform engineering | Weeks 2–6 | This is the gate. If it fails, no agentic capability proceeds regardless of appetite. |
| A2 | Begin assembling the known-issue corpus | Security engineering | Start immediately | Takes months. It's the only recall benchmark that means anything for tool selection — vendor benchmarks run on vendor-selected corpora. |
| A3 | Instrument the reviewer-caught defect rate **before** introducing agentic review | Security architecture | Before Phase 1 | Needs a pre-AI baseline or it's useless. This is the only practical leading indicator of over-reliance (R05/F14), and it's the risk with the weakest technical mitigation in the pack. |
| A4 | Constitute the AI Governance Board and define the agent lifecycle process | CISO / chief architect | Weeks 1–4 | No agent gets an identity without registration and a named sponsor. |
| A5 | Ratify the 15 principles and 14 anti-patterns as binding ARB criteria | ARB | Weeks 1–2 | Turns the pack from a document into a review instrument. |
| A6 | Design the agent identity and delegation service | Platform engineering | Weeks 3–8 | Chain 1 in §15.2 — attribution before autonomy. Nothing agentic proceeds without it. |
| A7 | Design the evidence store schema and integrity model | Platform engineering | Weeks 3–8 | Chain 2 — evidence collected retrospectively isn't evidence. |
| A8 | Specify and independently pen-test Z0 sandbox isolation | Security engineering | Phase 1 | The isolation claim needs testing, not asserting. AP1 is the anti-pattern I'd expect to see most often in practice. |
| A9 | Map every compliance control to a deterministic evidence source | Risk & audit + security architecture | Phase 0 | P11. Far cheaper to design in than to retrofit after a regulator challenges an AI-derived control. |
| A10 | Write the external disclosure policy (H12) | Security leadership + legal | Immediate | Agentic discovery against open-source dependencies **will** produce findings in code you don't own. |
| A11 | Set token and wall-clock budgets, and cost attribution model | Platform steering | Phase 0 | F8/R07. Unbounded agentic execution is a real cost failure mode, not a theoretical one. |
| A12 | Review all existing and proposed KPIs for volume metrics | Security architecture | Weeks 1–4 | AP6. If any KPI counts findings, this whole architecture will be optimised against itself. |

---

## Notes and caveats — my flags, for your judgement

| # | Note | Detail |
|---|---|---|
| N1 | Option scores in §7.4 are illustrative | Weights are mine. If this goes to a board unchanged, someone will reasonably ask where they came from — and they'd be right to. Re-set them or keep the caveat prominent. |
| N2 | I added a seventh control point that wasn't in the source prompt | CP7 (agent action). The other six govern *artefacts*. An agent that reads data, calls a service or executes code without committing anything is otherwise entirely ungoverned. I think this is the most important structural addition in the pack, and it's the one most worth challenging. |
| N3 | AIBOM is treated as mandatory, not optional | §9.5. If agents contribute to code, the models, prompt/skill versions and workflow versions are part of that artefact's provenance. I'd expect audit to find this gap eventually. |
| N4 | The fail-open / fail-closed asymmetry is deliberate | §12.2. Control services fail closed; augmentation services fail open. If the agentic layer is down, delivery continues on deterministic security. If policy is down, nothing ships. Worth an explicit conversation — it's an easy thing to get backwards under delivery pressure. |
| N5 | F14 (over-reliance) has the weakest mitigation in the pack | It's cultural, emerges slowly, and is invisible in the metrics most organisations collect. A3 is the mitigation and it's a weak one. If you have a better idea here, it's the highest-value improvement to the pack. |
| N6 | Market assessments have a short shelf life | §7 and §13 reflect July 2026. This domain is moving faster than typical EA refresh cycles. Recommendation 12 sets annual revalidation; six-monthly may be more honest. |
| N7 | The Mermaid Gantt in §14.6 renders inconsistently | Long task names clip in GitHub's viewport at some widths. Check it before any ARB submission that depends on the roadmap view. |
| N8 | Assumptions in §6.6 are load-bearing | Eight of them. Single SCM platform, IdP with workload identity federation, controllable network egress, sufficient platform team capacity. If any are false, the option recommendation changes — the capacity one in particular flips open-source-first from viable to not. |

---

## Things I deliberately did not do

- **Select products.** §13 gives weighted criteria and a proof-of-value protocol instead. Product selection needs your licence estate, regulatory scope and team capacity as inputs.
- **Propose any L4 (fully autonomous) capability.** Not within the 36-month horizon, anywhere in the architecture.
- **Size the investment.** Cost modelling needs your platform team rates, licence positions and estate size.
- **Assume your regulatory framework.** The pack says "regulated environment" and stays framework-agnostic. Mapping controls to your specific obligations is real work I couldn't do without knowing them.
