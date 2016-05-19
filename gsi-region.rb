require 'json'

r = JSON.parse(File.open('polbnda_jpn.geojson').read)
r['features'].each{|f|
  %w{f_code coc nam laa pop ypc salb soc}.each{|k| f['properties'].delete(k)}
  pref = f['properties']['adm_code'].to_i / 1000
  fill = '#555'
  case pref
  when 1
    fill = '#f7f'
  when 2..7
    fill = '#0f7'
  when 8..14, 19..20
    fill = '#f73'
  when 15..18
    fill = '#77f'
  when 21..24
    fill = '#caf'
  when 25..30
    fill = '#ca4'
  when 31..35
    fill = '#cf0'
  when 36..39
    fill = '#c70'
  when 40..46
    fill = '#c04'
  when 47
    fill = '#474'
  end
  f['properties']['fill'] = fill
}
File.open('gsi-region.geojson', 'w'){|w| w.print JSON.dump(r)}
