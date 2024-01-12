"""
The primary function in this file, `create_boost_aliases`, automates the creation of alias rules for Boost library targets.

The function takes a list of Boost target names and optional additional arguments for the alias rule. It supports handling Boost targets with sub-components (indicated by a dot in the target name) by properly mapping them to their corresponding Bazel targets.

The intended use for this function is in the @boost module of the Bazel Central Registry. This module provides a simple way for users to depend upon all boost libraries as a single module, and reference them using the syntax @boost//:libraryName for convenience.
"""

def create_boost_aliases(target_list, **kwargs):
    """ Create aliases for a list of targets

    Args:
      target_list: List of targets to be aliased from the dep the the main module
      **kwargs: Additional arguments to pass to the alias rule
    """
    for target in target_list:
        if "." in target:  # Check if there is a dot in the target
            rule_name = target.split(".")[-1]  # If so, get the last segment. This will be the rule name
        else:
            rule_name = target

        # Define the alias
        native.alias(
            name = target,
            actual = "@boost." + target + "//:" + rule_name,
            **kwargs
        )
