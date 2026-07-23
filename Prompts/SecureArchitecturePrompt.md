
## Master prompt

Use this as the main prompt when you want the model to produce the full architecture option pack.

> Act as an enterprise security architect, platform architect, AI architect, and DevSecOps transformation lead.  
>  
> Create an enterprise architecture option pack for an AI-enabled secure software delivery pipeline focused on cybersecurity and secure-by-design application development.  
>  
> The scope must cover the full lifecycle required to create, develop, test, secure, deploy, operate, sustain, and maintain secure applications in an enterprise environment.  
>  
> The deliverable must be suitable for executive stakeholders, architecture review boards, platform engineering teams, security engineering teams, and delivery teams.  
>  
> ## Objectives  
> - Define a target-state AI-enabled DevSecOps architecture.  
> - Show how AI can be leveraged across all steps of the software delivery lifecycle.  
> - Emphasize cybersecurity, governance, assurance, and enterprise control requirements.  
> - Compare commercial, open-source, and hybrid architecture options.  
> - Include agentic security capabilities such as autonomous or semi-autonomous bug-finding, validation, triage, remediation support, and secure developer assistance.  
>  
> ## Context  
> - Enterprise scale.  
> - Regulated environment.  
> - Strong requirements for identity, secrets protection, auditability, policy enforcement, separation of duties, and human accountability.  
> - Assume hybrid infrastructure across on-premises, private cloud, and public cloud.  
> - Assume secure SDLC, platform engineering, and compliance requirements already exist but need to be modernized for AI and agentic workflows.  
>  
> ## Architecture scope  
> Cover all of the following capability areas:  
> 1. Business demand intake and requirements definition  
> 2. Threat modeling and secure architecture design  
> 3. Developer enablement and coding assistance  
> 4. Secure code review and pull request governance  
> 5. Dependency, package, secrets, and IaC scanning  
> 6. Agentic vulnerability discovery and exploit validation  
> 7. Build, artifact, provenance, and signing controls  
> 8. Test generation, quality validation, and security regression testing  
> 9. Deployment approval, release orchestration, and environment promotion  
> 10. Runtime monitoring, workload protection, and anomaly detection  
> 11. Incident response feedback into engineering backlogs  
> 12. Technical debt reduction, patching, sustainment, and lifecycle maintenance  
> 13. Continuous compliance, evidence capture, and audit reporting  
> 14. AI governance, model risk, prompt/data protection, and agent control  
>  
> ## Required outputs  
> Produce the output in the following sections:  
> 1. Executive summary  
> 2. Business drivers and goals  
> 3. Architecture principles  
> 4. High-level capability map across the lifecycle  
> 5. High-level reference blueprint  
> 6. Next-level-down logical architecture  
> 7. Architecture option pack: commercial-first, open-source-first, hybrid  
> 8. AI use cases mapped to each SDLC phase  
> 9. Cybersecurity controls and trust boundaries  
> 10. Governance and operating model  
> 11. Risks, constraints, and anti-patterns  
> 12. Non-functional requirements  
> 13. Tooling decision criteria  
> 14. Phased roadmap for 12, 24, and 36 months  
> 15. Recommendations and adoption sequencing  
>  
> ## Specific cybersecurity direction  
> Assess how agentic security capabilities could fit into the pipeline. Include patterns inspired by or comparable to:  
> - Microsoft MDASH-style multi-agent vulnerability discovery and validation  
> - Google Mantis-style staged vulnerability research and patch workflow  
> - Other enterprise-relevant patterns for agentic bug-finding, security review, and remediation support  
>  
> Distinguish between:  
> - Productized enterprise-ready capabilities  
> - Research or experimental frameworks  
> - Open-source extensible building blocks  
>  
> ## Important requirements  
> - Separate “high level” from “next level down” detail.  
> - Use tables for comparisons.  
> - Include trust zones, control points, approval gates, and evidence flows.  
> - Include where humans must remain in the loop.  
> - Show the role of identity, secrets, policy-as-code, telemetry, and software supply chain security.  
> - Include benefits, risks, and enterprise readiness considerations for each architecture option.  
> - Include build vs buy considerations.  
> - Include how to measure value, risk reduction, and operational effectiveness.  
>  
> ## Output quality expectations  
> - Write in enterprise architecture language.  
> - Be practical, not theoretical.  
> - Assume the audience wants a blueprint they can adapt into a roadmap and reference design.  
> - Do not give only a tool list; provide architecture logic, interactions, and governance.  
> - Make the solution usable for architecture review, security review, and platform planning.

This prompt should produce a much better result than a generic “design me an AI DevSecOps pipeline” request because it forces structure, audience alignment, lifecycle completeness, and option analysis. That matters especially in agentic environments, where the pipeline becomes an active verifier rather than just a traditional gatekeeper.

## Blueprint prompt

Use this when you want only the board-level architecture and high-level blueprint.

> Act as an enterprise architect.  
>  
> Create a high-level blueprint for an enterprise AI-enabled DevSecOps and secure application delivery ecosystem.  
>  
> Focus on target-state architecture, major domains, platform layers, trust boundaries, key control points, and business/security outcomes.  
>  
> The blueprint must cover:  
> - Developer experience and engineering workflow  
> - AI assistance and agentic security services  
> - CI/CD and software supply chain  
> - Identity, secrets, keys, and policy enforcement  
> - Runtime security and operational monitoring  
> - Governance, audit, and compliance evidence  
>  
> Present the blueprint as:  
> 1. A one-page-style narrative architecture summary  
> 2. A layered architecture model  
> 3. A lifecycle capability map  
> 4. A list of critical control objectives  
> 5. A concise summary of architecture options: commercial, open-source, hybrid  
>  
> Keep it executive-friendly and architecture-review ready.

A good high-level blueprint should describe the major layers but avoid drowning the reader in product detail. It should clearly show that AI is embedded across requirements, coding, validation, deployment, runtime, and sustainment, while governance remains centralized through identity, policy, evidence, and approval controls. [perplexity](https://www.perplexity.ai/search/0e1821af-d0dc-4080-a424-31cfb60f0607)

## Detailed prompt

Use this when you want the “next level down” architecture.

> Act as a senior enterprise security and platform architect.  
>  
> Expand the high-level AI-enabled DevSecOps blueprint into a next-level-down logical architecture.  
>  
> Show the major components, interactions, trust zones, control flows, and operational mechanisms needed to implement the target state.  
>  
> Include:  
> - Source control, issue tracking, developer portals, and specification repositories  
> - Coding assistants, review assistants, and agent orchestration layers  
> - SAST, SCA, secrets scanning, IaC scanning, test orchestration, and agentic bug-finding services  
> - Artifact repositories, provenance, SBOM/AIBOM, signing, attestation, and policy engines  
> - CI/CD runners, environment promotion, deployment controls, and release approval gates  
> - Runtime telemetry, cloud/workload security, incident detection, and feedback loops  
> - Identity providers, workload identity, secrets managers, KMS/HSM, and certificate services  
> - Audit logging, evidence stores, compliance reporting, and model/agent governance  
>  
> For each major component, explain:  
> - Purpose  
> - Security relevance  
> - Required integrations  
> - Minimum control requirements  
> - Whether human approval is required  
>  
> Include at least three trust zones:  
> - Engineering and development zone  
> - Security validation and control zone  
> - Runtime and production zone  
>  
> Also include:  
> - Data flow for findings, fixes, approvals, and evidence  
> - Human-in-the-loop checkpoints  
> - Failure modes and compensating controls  
> - Enterprise integration assumptions  
>  
> Output as a detailed architecture narrative plus tables.

This is the prompt that should give you something close to a reference design, not just a slide headline. It is especially useful for surfacing where agent identities, permission boundaries, and sandbox execution need to sit. That is important because frameworks such as MDASH and Mantis both rely on staged analysis and validation patterns, but their enterprise implications differ materially. MDASH is presented as a Defender-integrated, CI/CD-capable capability with SARIF output and centralized results, while Mantis is framed as a flexible open-source starting point that requires isolated sandbox execution and human sign-off. [aiinsiders](https://aiinsiders.net/article/google-open-sources-mantis-a-15-stage-ai-pipeline-for)

## Option-pack structure

If you want a cleaner architecture-pack output, ask for this exact section order:

| Section | Purpose |
|---|---|
| Executive context | Business goals, risk drivers, why AI now.  [perplexity](https://www.perplexity.ai/search/0e1821af-d0dc-4080-a424-31cfb60f0607) |
| Architecture principles | Secure by design, least privilege, human accountability, composability.  [perplexity](https://www.perplexity.ai/search/0e1821af-d0dc-4080-a424-31cfb60f0607) |
| Lifecycle capability map | Where AI helps from design through sustainment.  |
| High-level blueprint | Layered target-state view. |
| Logical architecture | Components, flows, trust zones, approvals. |
| Architecture options | Commercial-first, OSS-first, hybrid. |
| Control model | Identity, secrets, signing, evidence, policy, telemetry.  [perplexity](https://www.perplexity.ai/search/3dd900b0-d2c9-4777-b85d-46a21139fce8) |
| Operating model | Teams, RACI, service ownership, approval boundaries. |
| Roadmap | 12/24/36-month transformation path. |
| Decision framework | Selection criteria, risks, constraints, tradeoffs. |

For enterprise use, I would also force the model to include “anti-patterns” such as unsandboxed agent execution, autonomous package introduction without allowlists, agent-written tests validating agent-written code with no independent checks, and AI tools bypassing standard PR or release controls. Those are exactly the kinds of issues emerging agentic DevOps guidance warns about. [aiinsiders](https://aiinsiders.net/article/google-open-sources-mantis-a-15-stage-ai-pipeline-for)

## Blueprint example

A simple high-level blueprint you can ask the model to elaborate would look like this:

- Experience layer: developer IDEs, copilots, engineering portal, work-item/specification management.  
- Delivery layer: SCM, PR workflows, CI pipelines, artifact repositories, release orchestration.  
- Security-AI layer: code scanning, secrets scanning, IaC scanning, agentic vulnerability research, remediation support, policy evaluation.  
- Trust layer: SSO, workload identity, secrets, KMS/HSM, attestation, signing, policy-as-code, evidence collection.  
- Runtime layer: cloud security, workload protection, observability, incident response, feedback to backlog.  
- Governance layer: model governance, agent governance, audit, compliance, risk reporting, architecture standards.

That structure aligns well with current agentic DevOps guidance, which stresses that repositories, specifications, pipelines, and governance together form the operating system for human-agent software delivery.

## Roadmap prompt

Use this when you want the roadmap only:

> Create a phased enterprise roadmap to adopt AI-enabled secure software delivery and agentic security capabilities.  
>  
> Break the roadmap into 0–6 months, 6–12 months, 12–24 months, and 24–36 months.  
>  
> For each phase include:  
> - Objectives  
> - Capabilities introduced  
> - Dependencies  
> - Governance activities  
> - Technology enablers  
> - Pilot candidates  
> - Risks and mitigation actions  
> - Success measures  
>  
> Prioritize secure foundations first, then controlled AI augmentation, then advanced agentic automation.

That sequencing is important because current agentic DevOps guidance explicitly says weak DevOps foundations get amplified by agents rather than fixed by them. It recommends strong CI/CD, automated testing, IaC, security scanning, branch protection, and observability as minimum readiness conditions before broad agent adoption.

## What else to consider

Beyond the architecture itself, an enterprise roadmap should plan for:

- Agent identity and delegated authority model. Agent actions should be attributable, scoped, and reviewable.
- Secure sandboxing for bug reproduction, exploit validation, and patch testing. Google’s Mantis guidance specifically warns to isolate reproduction and patching stages and keep them away from production systems. [aiinsiders](https://aiinsiders.net/article/google-open-sources-mantis-a-15-stage-ai-pipeline-for)
- Policy for human approval thresholds, especially for production changes, exploit execution, dependency additions, and code fixes. [aiinsiders](https://aiinsiders.net/article/google-open-sources-mantis-a-15-stage-ai-pipeline-for)
- Evidence model for prompts, findings, confidence, approvals, artifacts, and deployment decisions. MDASH emphasizes confidence scoring, deduplication, centralized findings, and pipeline integration, which makes evidence handling part of the architecture, not an afterthought.
- AI governance for model access, data handling, third-party provider use, retention, privacy, and prompt injection resistance. Agentic DevOps guidance calls out prompt injection through comments and issue descriptions, as well as scope creep and supply-chain manipulation.
- Metrics that measure outcomes, not volume, such as validated defect reduction, false-positive reduction, time to remediate, review efficiency, policy compliance, and escaped defect rate.

If you want the strongest next step, use the master prompt first, then run the detailed prompt afterward and tell the model to elaborate only the preferred architecture option.

