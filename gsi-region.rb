require 'json'

r = JSON.parse(File.read('polbnda_jpn.geojson'))
r['features'].each{|f|
  %w{f_code coc nam laa pop ypc salb soc}.each{|k| f['properties'].delete(k)}
  pref = f['properties']['adm_code'].to_i / 1000
  color = '#555'
  case pref
  when 1
    color = '#f7f'
  when 2..7
    color = '#0f7'
  when 8..14, 19..20
    color = '#f73'
  when 15..18
    color = '#77f'
  when 21..24
    color = '#caf'
  when 25..30
    color = '#ca4'
  when 31..35
    color = '#cf0'
  when 36..39
    color = '#c70'
  when 40..46
    color = '#c04'
  when 47
    color = '#474'
  end
  f['properties']['fill'] = color
  f['properties']['stroke'] = color
  f['properties']['fill-opacity'] = 0.6
}
File.write('gsi-region.geojson', JSON.dump(r))
