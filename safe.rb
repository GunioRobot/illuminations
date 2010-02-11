class Safe
  # This must be done in this order because &lt; will get translated to: &amp;lt;
  HTML = [
    ['&', '&amp;'],
    ['<', '&lt;'],
    ['>', '&gt;'],
    ['"', '&quot;']
  ]
  
  JSON = {
    %q(') => %q(\'),
    %q(") => %q(\")
  }
  
  FILENAME = {
    ':'   => '_', # This is the only character OS X (HFS+) prohibits
    %q(") => '',
    '*'   => '_',
    '.'   => '_',
    '/'   => '',
    '\\'  => '',
    "\s"  => '_',
    "\t"  => '',
    '['   => '(',
    ']'   => ')',
    ';'   => '_',
    '|'   => '_',
    '='   => '',
    ','   => '_'
  }
  
  # Safe always returns a copy
  
  def Safe.html(s)
    Safe.replace(HTML, s)
  end
  
  def Safe.json(s)
    Safe.replace(JSON, s)
  end

  def Safe.filename(s)
    Safe.replace(FILENAME, s)
  end
  
  def Safe.word(s)
    s.to_s.dup.gsub(/\W/, '')
  end
  
  def Safe.replace(replacements, string)
    dupe = string.to_s.dup
    replacements.each { |target, replacement| dupe = dupe.gsub(target) { replacement } }
    return dupe
  end
end