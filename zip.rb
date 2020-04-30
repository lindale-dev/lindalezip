module Lindale

require 'delegate'
require 'singleton'
require 'tempfile'
require 'tmpdir'
require 'fileutils'
require 'rbconfig'
require 'stringio'
require 'zlib'
Sketchup.require File.join(__dir__,'zip/dos_time')
Sketchup.require File.join(__dir__,'zip/ioextras')
Sketchup.require File.join(__dir__,'zip/entry')
Sketchup.require File.join(__dir__,'zip/extra_field')
Sketchup.require File.join(__dir__,'zip/entry_set')
Sketchup.require File.join(__dir__,'zip/central_directory')
Sketchup.require File.join(__dir__,'zip/file')
Sketchup.require File.join(__dir__,'zip/input_stream')
Sketchup.require File.join(__dir__,'zip/output_stream')
Sketchup.require File.join(__dir__,'zip/decompressor')
Sketchup.require File.join(__dir__,'zip/compressor')
Sketchup.require File.join(__dir__,'zip/null_decompressor')
Sketchup.require File.join(__dir__,'zip/null_compressor')
Sketchup.require File.join(__dir__,'zip/null_input_stream')
Sketchup.require File.join(__dir__,'zip/pass_thru_compressor')
Sketchup.require File.join(__dir__,'zip/pass_thru_decompressor')
Sketchup.require File.join(__dir__,'zip/crypto/encryption')
Sketchup.require File.join(__dir__,'zip/crypto/null_encryption')
Sketchup.require File.join(__dir__,'zip/crypto/traditional_encryption')
Sketchup.require File.join(__dir__,'zip/inflater')
Sketchup.require File.join(__dir__,'zip/deflater')
Sketchup.require File.join(__dir__,'zip/streamable_stream')
Sketchup.require File.join(__dir__,'zip/streamable_directory')
Sketchup.require File.join(__dir__,'zip/constants')
Sketchup.require File.join(__dir__,'zip/errors')

module Zip
  extend self
  attr_accessor :unicode_names,
                :on_exists_proc,
                :continue_on_exists_proc,
                :sort_entries,
                :default_compression,
                :write_zip64_support,
                :warn_invalid_date,
                :case_insensitive_match,
                :force_entry_names_encoding

  def reset!
    @_ran_once = false
    @unicode_names = false
    @on_exists_proc = false
    @continue_on_exists_proc = false
    @sort_entries = false
    @default_compression = ::Zlib::DEFAULT_COMPRESSION
    @write_zip64_support = false
    @warn_invalid_date = true
    @case_insensitive_match = false
  end

  def setup
    yield self unless @_ran_once
    @_ran_once = true
  end

  reset!
end

end

# Copyright (C) 2002, 2003 Thomas Sondergaard
# rubyzip is free software; you can redistribute it and/or
# modify it under the terms of the ruby license.
