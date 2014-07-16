## Ansible Prompt

Playbook setting up git aware prompt. Example:
``` user@machine ~/projects/ansible-prompt (master *+) $ ```

### Usage
To run this playbook against your local machine use inventory file ``` localhost ```:

``` ansible-playbook -i localhost prompt.yml ```

### Requirements
You'll need Ansible if you don't already have it. Get it from [here](http://docs.ansible.com/intro_installation.html)
