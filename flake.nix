{
  # Description of the flake
  description = "A simple flake with 1 template";

  # Outputs function, it's a function that takes an argument named 'self'
  outputs = { self }: {

    # Templates attribute, it's a set of templates
    templates = {

      # Example template, it's a single template in the set
      example = {
        # Path to the template
        path = ./default;
        # Description of the template
        description = "Basic NixOS config flake";
      };

    };

    # Default template, it's the template that will be used by default
    defaultTemplate = self.templates.example;

  };
}