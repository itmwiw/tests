Find the documentation for event listeners, trigger bindings, and trigger templates here: https://tekton.dev/vault/triggers-v0.6.1/eventlisteners/
Additionally, an example and the actual implementation we use for most pipelines are available here: https://github.com/OneHQ/platform-onehq-iac/blob/master/onehq-apps/onehq-ci-cd/legacy/event-listener.yaml

Tutorial to help you understand each component: https://www.arthurkoziel.com/tutorial-tekton-triggers-with-github-integration/

Essentially, you have two pipelines:
A generic pipeline triggered by the GitHub event: It is responsible for preparing the environment (namespaces, roles, role bindings) and then fetching the appropriate repository that contains a 'more specific' pipeline. Subsequently, it deploys and runs this pipeline.
The 'more specific' pipeline, which is part of each project repository, for example, in the .tekton or deploy folder. It could be in another folder, as long as the generic pipeline is aware of its location. This pipeline is deployed and executed by the generic pipeline described above.

It is important to have these two pipelines for security reasons, ensuring separate namespaces and granular permissions. Additionally, it is beneficial as it allows for refactoring. For example, most pipelines, except for agencieshq I think, utilize the onehq-pipelines components that I sent you above.
