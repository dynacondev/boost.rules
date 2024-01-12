# `boost.rules` - The [boost](https://registry.bazel.build/modules/boost) module in the [Bazel Central Registry](https://registry.bazel.build/)

This repository provides the simplest way to get [Boost](https://boost.org) into your [Bazel](https://bazel.build) project!  

It is provided as a convenient way to include ALL of the Boost libraries into a project at once. It is intended for those who don't want to "bazel_dep" every single boost library they need, and while it is slightly less internet efficient (as it downloads all of boost), it will still only build the parts you need, and you can then depend on any module with a simple `@boost//:libraryName`

## 👨‍💻 Usage

Firstly, make sure you're using [Bazel](https://bazel.build) and have [BZLMOD](https://bazel.build/external/overview#bzlmod) enabled!  

Secondly, copy the code from the install section of the [module page](https://registry.bazel.build/modules/boost) into your `MODULE.bazel` file.  

Thirdly, add whichever Boost dependencies you need to your rule in your `BUILD.bazel` file, for example:

```Starlark
cc_binary(
    name = "my_program",
    deps = [
        "@boost//:array",
    ],
)
```

***Important Note:***

Some specific boost libraries have marginally unintuitive targets due to the way boost library naming conventions convert to bazel target names. Notably, these are:

- `@boost//:graph.parallel`
- `@boost//:numeric.conversion`
- `@boost//:numeric.interval`
- `@boost//:numeric.odeint`
- `@boost//:numeric.ublas`
- `@boost//:property_map.parallel`

If you're unsure what boost targets are available, you can always run `bazel query "@boost//:*"` from your project directory to see the full list.