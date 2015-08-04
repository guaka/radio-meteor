Here you can define the channels of your stream.
Pull requests for ad free radio stations welcome.
Discussion about improvments at [#47](https://github.com/guaka/radio-meteor/issues/47)

	@channels = 
	
## SomaFM streams

The soma tag is used to build the stream URL.

		'cliqhop': { tags: ['soma', 'idm'] }
		'secretagent': { tags: ['soma'] }
		'illstreet': { tags: ['soma'] }
		'spacestation': { tags: ['soma'] }
		'doomed': { tags: ['soma'] }
		'missioncontrol': { tags: ['soma'] }
		'beatblender': { tags: ['soma'] }
		'bootliquor': { tags: ['soma'] }
		'brfm': { tags: ['soma', 'burningman'] }
		'covers': { tags: ['soma'] }
		'digitalis': { tags: ['soma', 'indie'] }
		'dronezone': { tags: ['soma'] }
		'groovesalad': { tags: ['soma', 'indie'] }
		'indiepop': { tags: ['soma', 'indie'], twitter: 'indiepoprocks' }
		'lush': { tags: ['soma', 'female'] }
		'poptron': { tags: ['soma'] }
		'suburbsofgoa': { tags: ['soma', 'world'] }
		'u80s': { tags: ['soma'] }
		'bagel': { tags: ['soma'] }
		'sf1033': { tags: ['soma'] }
		'dubstep': { tags: ['soma'] }


## Malian music rocks

		'wassoulou':
                    url: 'http://listen.radionomy.com/radio-wassoulou-internationale'
                    tags: ['mali', 'africa']


## More electronic

		'chillstep.info':
                    url: 'http://chillstep.info:1984/listen.ogg'
                    tags: ['dubstep', 'chill']

## Classical

		'concertzender':
                    url: 'http://streams.greenhost.nl:8080/live'
                    tags: ['nl', 'classical']

                'klara':
                    url: 'http://mp3.streampower.be/klara-high.mp3'
                    tags: ['be', 'classical']

## Paradise

		'paradise':
                    url: 'http://stream-uk1.radioparadise.com/mp3-128'
                    tags: ['rock']

## News

		'bbcworld':
                    url: 'http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-eieuk'
                    tags: ['uk', 'news']
		
## French excellence

		'fip':
                    url: 'http://audio.scdn.arkena.com/11016/fip-midfi128.mp3'
                    tags: ['fr', 'paris', 'jazz', 'eclectic']
            
		'ledjam':
                    url: 'http://ledjamradio.ice.infomaniak.ch/ledjamradio.mp3'
                    fb: 'https://www.facebook.com/ledjamradio'
            
		'meuh':
                    url: 'http://radiomeuh.ice.infomaniak.ch/radiomeuh-128.mp3'

## Alternative from Brussels

		'radiopanik':
                    url: 'http://streaming.domainepublic.net:8000/radiopanik.ogg'
                    tags: ['libre', 'bxl', 'be']
            
		'radioairlibre':
                    url: 'http://streaming.domainepublic.net:8000/radioairlibre.ogg'
                    tags: ['libre', 'bxl', 'be']
            
		'radiocampusbxl':
                    url: 'http://streamer.radiocampusbruxelles.org:8000/stream.ogg'
                    tags: ['bxl', 'be']
                    twitter: 'radiocampusbxl'


## Swiss-French 

		'couleur3':
                    url: 'http://stream.srg-ssr.ch/m/couleur3/mp3_128'
                    tags: ['ch']

## Streams with ads

These should be turned off by default, but can be enabled by clicking on the tags (to implement).


		#'oldmen':
		#   url: 'http://server-10.stream-server.nl:8140/'
		#   tags: ['ads', '60s', '70s']
		
		# todo: parse pls in client?
		# '106fmcoil': { url: 'http://212.29.254.129:7075/listen.pls' }
		


