# encoding: utf-8

File.open("test.txt").each_with_index do |line, index|
  next if index == 0
  data = line.force_encoding("iso-8859-1").split(/\t/)
  m_NO,m_TMNo,m_EnNo,m_Name,m_GMNo,m_Mode,m_DateTime = data
  puts "#{m_NO}\t#{m_EnNo}\t#{m_DateTime}"
end
