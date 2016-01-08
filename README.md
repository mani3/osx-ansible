# OSX provisioning

## Prerequisites

1. Install Xcode.app
2. Agree license this command:

  ```
  $ sudo xcodebuild -license
  ```

## Install ansible

```
$ ./setup.sh
```

## Provision

```
$ ansible-playbook -i hosts osx.yml -vvvv
```
