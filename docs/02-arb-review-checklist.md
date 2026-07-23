# ARB Conformance Review Checklist — AI-Enabled Secure Delivery

Use this at design review for any system, platform capability or tool introduction that involves AI assistance or agentic automation in the software delivery lifecycle.

**Scoring:** Pass / Fail / N-A with justification. Any Fail on a Section 1 item blocks approval. Fails elsewhere require a recorded, expiring exception approved by the security architecture authority.

---

## Section 1 — Blocking conformance items

| # | Check | Evidence required | P/F |
|---|---|---|---|
| 1.1 | Every agent in the design has a unique, scoped, time-bound identity | Identity model; entitlement definition | |
| 1.2 | Every agent identity resolves to a workflow and a named human sponsor | Delegation chain design; registry entry | |
| 1.3 | No agent holds a standing or shared credential | Credential lifetime specification | |
| 1.4 | The identity that proposes a finding cannot validate it | Control-plane enforcement mechanism, not policy statement | |
| 1.5 | Adversarial execution (reproduction, PoC, patch test) occurs only in Z0 | Sandbox architecture; isolation verification plan | |
| 1.6 | Z0 has no network path to production and no production credentials | Network design; credential scope | |
| 1.7 | Agent-authored change traverses the standard PR path with no exemption | Branch protection config; required checks; exemption list | |
| 1.8 | No agent can approve or merge any pull request | Permission model | |
| 1.9 | Every gated action writes an immutable evidence record | Evidence schema; write path; failure behaviour | |
| 1.10 | Every compliance control has a deterministic evidence source | Control-to-evidence mapping | |
| 1.11 | All model traffic transits the enterprise model gateway | Network egress design | |
| 1.12 | Secrets cannot enter agent context, prompts, logs or evidence | Context filtering; redaction at write | |
| 1.13 | Human approval is required at every checkpoint H1–H12 that applies | Approval design; approver roles | |
| 1.14 | Prompts, skills and workflow definitions are in version control and reviewed | Repository location; review requirement | |

---

## Section 2 — Anti-pattern screening

Confirm the design does **not** exhibit any of the following.

| # | Anti-pattern | Present? | Notes |
|---|---|---|---|
| AP1 | Unsandboxed agent execution on shared CI infrastructure | | |
| AP2 | Autonomous dependency introduction without allowlist and human approval | | |
| AP3 | Agent-written tests validating agent-written code with no independent check | | |
| AP4 | AI tooling with a fast path around PR or release controls | | |
| AP5 | Single-agent self-validation | | |
| AP6 | Finding volume, agent invocations or lines suggested used as a KPI | | |
| AP7 | Standing, broadly-scoped agent service accounts | | |
| AP8 | Prompts or skill templates outside version control | | |
| AP9 | Direct model provider access bypassing the gateway | | |
| AP10 | Unvalidated AI findings submitted to upstream open-source projects | | |
| AP11 | Agent confidence presented to reviewers as a merge recommendation | | |
| AP12 | A compliance control whose only evidence source is AI-derived | | |
| AP13 | Big-bang agentic rollout without phased calibration | | |
| AP14 | Agentic capability deployed onto a platform that has not passed the readiness gate | | |

---

## Section 3 — Principle conformance

| Principle | Testable implication | Conforms? |
|---|---|---|
| P1 Secure by default | New repo inherits all controls with zero configuration | |
| P2 Agents are principals | All agent actions attributable in audit logs | |
| P3 Discovery/validation separation | Structurally enforced, not conventional | |
| P4 Least privilege, ephemeral | No credential outlives its task | |
| P5 Untrusted context | Untrusted input cannot alter agent scope | |
| P6 Evidence over assertion | Reproduction artefact or explicit unproven flag | |
| P7 No privileged path | Zero exemptions from standard controls | |
| P8 Human accountability | Named approval at irreversible boundaries | |
| P9 Policy as code | Every control point calls a decision point; fails closed | |
| P10 Model pluggability | Provider swap is configuration-only | |
| P11 Deterministic base | Every control has a non-AI fallback | |
| P12 Isolation | Adversarial execution isolated and ephemeral | |
| P13 Unbroken provenance | Verifiable chain from commit to admission | |
| P14 Composability | Open formats at every interface | |
| P15 Outcome measurement | No volume-based KPI | |

---

## Section 4 — Tooling introduction gates

Complete only if the design introduces a new tool or service.

| # | Mandatory gate | Met? |
|---|---|---|
| MG1 | Enterprise SSO/IdP integration | |
| MG2 | No standing static credentials required | |
| MG3 | Complete, exportable audit logs | |
| MG4 | Data residency obligations met for intended classification | |
| MG5 | Does not train on enterprise data | |
| MG6 | Enforceable within or at the boundary of the enterprise policy model | |
| MG7 | Findings exportable in an open format | |
| MG8 | *(Agentic only)* Supports separation of proposing and validating identities | |
| MG9 | *(Agentic only)* Executable in enterprise-controlled isolated infrastructure | |
| MG10 | Vendor/project security posture assessed and acceptable | |

**Capability classification** — record honestly:

- [ ] Productised enterprise-ready → may enter the production control path
- [ ] Research / experimental framework → pilot only, isolated, never a sole assurance source, time-boxed with exit criteria
- [ ] Open-source extensible building block → production permitted with enterprise operation, hardening and a named owner

---

## Section 5 — Measurement conformance

| # | Check | P/F |
|---|---|---|
| 5.1 | Precision of every finding source is measured and reported | |
| 5.2 | Recall is measured against the enterprise's own known-issue corpus, not vendor benchmarks | |
| 5.3 | Reviewer-caught defect rate is instrumented with a pre-AI baseline | |
| 5.4 | Cost per validated finding is attributable to the owning team | |
| 5.5 | No proposed KPI counts volume of any kind | |

---

## Reviewer sign-off

| Role | Name | Decision | Date |
|---|---|---|---|
| Security architect | | | |
| Platform architect | | | |
| Chief architect / ARB chair | | | |

**Exceptions raised:** _(list with scope, compensating control and mandatory expiry date)_
