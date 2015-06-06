## bundle viz

Generates a visual dependency graph.

``` bash
$ bundle viz [--file=FILE] [--format=FORMAT] [--requirements] [--version]
             [--without=GROUP GROUP]
```

**Options:**

`-f, --file`: The name to use for the generated file. see format option

`-F, --format`: This is output format option. Supported format is png, jpg, svg, dot ...

`-r, --requirements`: Set to show the version of each required dependency.

`-v, --version`: Set to show each gem version.

`--without`: Exclude gems that are part of the specified named group.

**Learn More:** [Groups](./groups.md)

`viz` generates a PNG file of the current Gemfile as a dependency graph. `viz` requires 
the `ruby-graphviz` gem (and its dependencies). The associated gems must also be 
installed via `bundle install`.
