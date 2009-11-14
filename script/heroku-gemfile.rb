#!/usr/bin/env ruby

def disable_rubygems; nil; end
def clear_sources; nil; end
def bundle_path(*args); nil; end
def source(s); $src = s unless s[/gemcutter/] end
def gem(*args)
  n = args.shift
  puts n
end
load ARGV[0] || "Gemfile"
