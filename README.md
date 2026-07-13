# Socratic Tutor

Large language models (LLMs) are beneficial for minds that can think critically and have some understanding of the domain they are working in. This project seeks to flip the normal use of LLMs from providing easy answers to guiding students towards applying what they have learned to solve problems and understand the solution.

The system prompt creates a Socratic tutoring chatbot designed to help students with school work by summarizing the concepts behind the problem they are working on and responding with questions that inspire critical thinking and problem-solving without explicitly giving away the answers. If the student struggles, the chatbot will encourage them to seek help from a teacher or parent.

This can be run entirely on-premises with tools like [ollama](https://ollama.com/) and [open-webui](https://openwebui.com/) which eliminates third-party cloud data tracking, subscription fees, and complex COPPA/FERPA compliance overhead—making it an ideal blueprint for classroom sandboxes and privacy-first deployments.

---

## Repository Structure

```text
├── LICENSE.md          # Strong copyleft protection (AGPLv3)
├── README.md           # Project documentation
├── .gitignore          # Keeps build artifacts out of version control
├── system_prompt.md    # The core Socratic logic and persona rules
├── build.sh            # Universal portability script to compile profiles
└── models/             # Directory for hardware-specific configuration templates
    └── gemma4_e4b_mini_pc.Modelfile
```

## Getting Started

This repository keeps the model settings and the core prompt logic separated so you can tweak the system prompt in a clean Markdown environment without breaking your deployment configurations.

### Prerequisites

1. Install Ollama on your local machine or server stack.

1. Pull the base model you wish to use (e.g., ollama pull gemma4:e4b-it-qat).

### Building the Model File

To combine the system prompt with a hardware-specific configuration and register it with Ollama, use the portable build.sh script.

1. Give execution permissions to the script:

```bash
chmod +x build.sh
```

2. Run the build script by passing the name of the configuration profile from the models/ folder (omit the .Modelfile extension):

```bash
./build.sh gemma4_e4b_mini_pc
```

3. Choose your step:

  * The script will automatically assemble the final assets inside a localized /dist directory (which is safely ignored by Git).

  * It will then prompt you to automatically compile and register the model live inside your active local Ollama environment as socratic-gemma4_e4b_mini_pc.

## Hardware & Configuration Optimization

The profile templates in models/ are pre-configured to optimize context windows, threading boundaries, and temperature balances for specific computing classes:

* *gemma4_e4b_mini_pc*: Tuned for cost-effective, consumer-tier edge hardware (e.g., mini PCs with modern multi-core mobile CPUs). It locks thread constraints to protect performance and sets an expanded context window (8192 tokens) to sustain prolonged, deeply context-rich classroom dialogue.

## License

This project is licensed under the GNU Affero General Public License v3 (AGPLv3).

I believe in a strong copyleft ecosystem for educational AI tools. If you modify this Socratic framework or build web-facing services/APIs leveraging this logic over a network, you must make your modified source code publicly accessible under the same AGPLv3 terms.

## Enterprise & Education Deployments

Are you an IT Director, instructional technology coach, or administrator interested in deploying a secure, air-gapped AI sandbox on your district's internal local area network?

If you want custom infrastructure blueprints, network load-balancing strategies for high-concurrency classrooms, or guided teacher onboarding pilots, feel free to open a discussion or reach out directly:

[![Email](https://img.shields.io/badge/Email-brightam1%40gmail.com-blue?style=for-the-badge&logo=gmail)](mailto:brightam1@gmail.com?subject=Socratic%20Tutor%20Consulting%20Inquiry)

## Support the Project

If this Socratic logic helps your students or saves your team data compliance headaches, consider supporting ongoing open-source development!

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W1H3233V29)