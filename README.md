# boost.rules
This is the "boost" module in the Bazel Central Registry. It is provided as a simple way to include ALL boost libraries into a project for those who don't want to "bazel_dep" every single boost library they need. It provides the main target of each library at "@boost//:&lt;libraryName>".
