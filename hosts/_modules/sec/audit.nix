{ ... }: {
  security.audit = {
    enable = true;

    rules = [
      "-a always,exit -S execve -k process_launch"
      "-w /etc/passwd -p wa -k identity"
    ];
  };
}
