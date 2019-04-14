local utils = require 'pandoc.utils'

function read_file (filename)
  local fh = io.open(filename)
  local content = fh:read('*a')
  fh:close()
  return content
end

function sample_blocks (sample_file)
  local sample_content = read_file(sample_file)
  local sample_attr = pandoc.Attr('', {'markdown', 'sample'})
  return {
    pandoc.Header(3, pandoc.Str(sample_file)),
    pandoc.CodeBlock(sample_content, sample_attr)
  }
end

function code_blocks (code_file)
  local code_content = read_file(code_file)
  local code_attr = pandoc.Attr(code_file, {'lua'})
  return {
    pandoc.CodeBlock(code_content, code_attr)
  }
end

function Pandoc (doc)
  local meta = doc.meta
  local blocks = doc.blocks

  blocks:extend{pandoc.Header(2, 'Example', pandoc.Attr('Example'))}
  blocks:extend(sample_blocks(meta.sample_files))
  blocks:extend{pandoc.Header(2, 'Code', pandoc.Attr('Code'))}
  blocks:extend(code_blocks(meta.code_file))

  return pandoc.Pandoc(blocks, meta)
end
