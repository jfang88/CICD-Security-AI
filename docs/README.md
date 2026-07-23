# AI-Enabled Secure Software Delivery — Enterprise Architecture

Target-state reference architecture and option pack for an AI-enabled, secure-by-design software delivery pipeline in a regulated enterprise, covering the full lifecycle from demand intake through sustainment.

## Contents

| Document | Purpose | Audience |
|---|---|---|
| [`docs/01-architecture-option-pack.md`](docs/01-architecture-option-pack.md) | The full option pack — 15 sections, blueprint, logical architecture, three architecture options, controls, governance, roadmap | ARB, security architecture, platform engineering, executives |
| [`docs/02-arb-review-checklist.md`](docs/02-arb-review-checklist.md) | Conformance checklist derived from the architecture principles and anti-pattern register | Architecture Review Board, design authorities |

## The core argument in three sentences

Agentic security systems turn the delivery pipeline from a passive gatekeeper into an active verifier, which means the control model must govern *actions by non-human principals*, not just artefacts. An agentic finding is an assertion, not a finding, and only becomes evidence when validated by a mechanism whose trust properties are independent of the model that proposed it. The enterprise should buy the commodity layers and build the control plane — agent identity, model gateway, policy engine and evidence store — because those four components determine whether it can govern, audit and change everything else.

## Recommended option

**Hybrid.** Commercial for delivery spine and deterministic scanning; enterprise-owned control plane, gateway, policy and evidence; open-source for the agentic research layer with commercial agentic capability adopted in parallel where productised and eligible. See §7.3 and §7.4.

## Non-negotiable design rules

| Rule | Reference |
|---|---|
| Discovery and validation operate under separate identities | P3 / CO-06 |
| Adversarial execution occurs only in hard-isolated, ephemeral sandboxes (Z0) | P12 / CO-07 |
| Agent-authored change traverses the standard PR path with zero exemptions | P7 / CO-05 |
| Every agent action resolves to a scoped entitlement and a named human sponsor | P2 / CO-02 |
| Every compliance control has a deterministic evidence source independent of AI | P11 / CO-15 |
| No KPI counts finding volume, agent invocations, or lines suggested | P15 / AP6 |

## Adoption sequence

Three dependency chains that cannot be reordered (§15.2):

1. **Attribution before autonomy** — agent identity → registry → entitlements → control plane → any agentic capability
2. **Evidence before assurance** — evidence store → decision logging → control mapping → continuous compliance
3. **Precision before scale** — deterministic baseline → known-issue corpus → validation plane → measured precision → scaled discovery

## Status

Draft for architecture and security review. Weighted option scores in §7.4 use illustrative weights that must be re-set by the ARB against enterprise-specific priorities before being treated as a decision input.

Market assessments in §7 and §13 are current as at July 2026 and should be revalidated annually — see recommendation 12.
