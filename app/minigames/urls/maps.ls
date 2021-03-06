out$, require, module <- require.register 'minigames/urls/maps'

require! {
  'minigames/urls/LocationIndicator'
}

export towns = {
  bulbous: [740 212]
  shackerton: [882 1252]
  phb: [368 738]
  flee: [1430 900]
  drudshire: [1151 460]
}

export main-map = {
  map-url: '/content/bg-tiles/url-minigame/map'
  nodes:
    shackerton: [1014 1235 'shackerton-by-sea.com' 'to Shackerton\nBy-Sea' -50 -210]
    flee: [1439 989 'flee.net' 'to Flee' -185 -110]
    drudshire: [1266 665 'drudshire.biz' 'to Drudshire' -70 20]
    bulbous: [863 444 'bulbous-island.com' 'to Bulbous\nIsland' -70 15]
    phb: [602 849 'ponyhead-bay.com' 'to Ponyhead\nBay' 70 -55]
    junction-shackerton: [1027 965]
    junction-flee: [1240 831]
    junction-drudshire: [1266 752]
    junction-bulbous: [857 545]
    junction-phb: [871 852]
  paths: [
    [\shackerton \junction-shackerton [1047 1172] [1027 965]]
    [\flee \junction-flee [1239 1002] [1313 863]]
    [\drudshire \junction-drudshire [1271 719] [1266 752]]
    [\bulbous \junction-bulbous [830 488] [857 545]]
    [\phb \junction-phb [602 849] [774 792]]
    [\junction-shackerton \junction-flee [1137 966] [1157 832]]
    [\junction-flee \junction-drudshire [1240 831] [1263 785]]
    [\junction-drudshire \junction-bulbous [1097 718] [1045 459]]
    [\junction-bulbous \junction-phb [935 731] [843 771]]
    [\junction-phb \junction-shackerton [871 852] [972 938]]
  ]
}

export bulbous = {
  map-url: '/content/bg-tiles/url-minigame/bulbous-island'
  start: x: 1000, y: 1700 #Arca start point
  scale: 0.12
  rects: [
    [350 300 600 200]
    [1050 300 600 200]
    [875 300 250 100 \enter:onions-r-us]
    [350 400 75 1125]
    [1575 400 75 1125]
    [350 1450 600 500]
    [1050 1450 600 500]
    [475 1250 475 150]
    [475 550 475 150]
    [475 550 250 850]
    [1050 1250 475 150]
    [1050 550 475 150]
    [1275 550 250 850]
    [775 750 200 125]
    [775 750 125 450]
    [775 1075 200 125]
    [925 900 150 150]
    [1025 750 200 125]
    [1025 1075 200 125]
    [1100 750 125 450]
    [925 1775 150 50 \exit]

    # Walk-through-able rectangles
    [475 1375 250 100 \path:hospital]
    [1275 1375 250 100 \path:school]
    [875 850 250 250 \path:fountain]
    [700 750 100 125 \path:onion-farm]
    [925 375 150 200 \path:onions-r-us]
  ]

  buildings:
    onions-r-us:
      map-url: '/content/bg-tiles/url-minigame/onions-r-us'
      position: x: 750, y: 50
      scale: 1/4
      player-scale: 0.8
      rects: [
        [0 1650 2000 125 \exit]
        [0 1300 820 400]
        [1180 1300 820 400]
        [0 1250 750 100]
        [1250 1250 750 100]
        [0 0 700 1300]
        [1305 0 700 1300]
        [0 0 2000 625]
        [900, 715, 200, 500]
        [500 1150 1000 800 \path:onions-r-us]
        [500 675 300 475 \path:onions-r-us/red-onions]
        [800 675 400 475 \path:onions-r-us/white-onions]
        [1200 675 300 475 \path:onions-r-us/spring-onions]
        [700 450 605 225 \path:onions-r-us/pickled-onions]
      ]
}

export drudshire = {
  map-url: '/content/bg-tiles/url-minigame/drudshire'
  start: x: 964, y: 1633
  scale: 0.12
  extras:
    location-indicator: new LocationIndicator 1662.5, 960, false
  rects: [
    [0 1600 925 400]
    [0 0 200 1700]
    [0 0 1900 200]
    [250 250 375 250]
    [250 550 375 175]
    [250 775 175 575]
    [250 1375 175 175]
    [450 775 175 175]
    [450 975 175 575]
    [675 1050 250 450]
    [800 1450 125 100]
    [675 875 75 200]
    [675 550 75 275]
    [675 250 75 250]
    [675 250 250 75]
    [775 350 150 325]
    [775 700 150 325]
    [1000 250 225 175]
    [1000 450 225 175]
    [1000 450 75 425]
    [1000 900 75 475]
    [1000 1125 350 250]
    [1100 650 125 450]
    [1100 650 250 225]
    [1250 650 100 525]
    [1250 250 200 375]
    [1250 250 500 250]
    [1675 450 75 125]
    [1475 525 175 575]
    [1375 550 75 325]
    [1375 900 75 625]
    [1375 1125 500 425]
    [1675 600 75 500]
    [1600 975 125 125]
    [1800 0 200 1200]
    [1000 1425 425 500]
    [900 1700 125 125 \exit]

    [650 1400 300 200 \path:police-station]
    [625 250 50 1250 \path:sarrow-street]
    [425 775 25 775 \path:weary-way]
    [1450 500 225 425 \path:gum-alley]
    [1650 925 25 50 \path:gum-alley/greasy-pete]
    [1075 625 300 500 \path:languid-lane]
  ]
}

export shackerton = {
  map-url: '/content/bg-tiles/url-minigame/shackerton'
  start: x: 1040, y: 168 #Arca start point
  scale: 0.12
  rects: [
    [0 0 1000 200] #0
    [1075 0 1000 200]#1
    [0 150 200 1450]#2
    [250 250 350 375]#3
    [625 250 375 375]#4
    [1075 250 300 350]#5
    [1425 150 1000 450]#6
    [250 600 150 675]#7
    [350 900 250 375]#8
    [425 650 400 225]#9
    [850 600 150 675]#10
    [625 900 250 375]#11
    [1075 625 300 275]#12
    [1425 625 325 275]#13
    [1775 575 1000 400]#14
    [1075 925 300 350]#15
    [1425 925 375 450]#16
    [225 1325 275 225]#17
    [175 1575 375 50]#18
    [525 1325 475 350]#19
    [950 1600 175 50]#20
    [1075 1325 400 350]#21
    [975 0 125 75 \exit]
    [400 625 450 275 \path:ristorante-del-amore]
    [1375 600 400 325 \path:love-park]
    [200 1275 325 300 \path:public-toilets]
    [1000 1375 200 200 \path:loveboat]
  ]
}

export phb = {
  map-url: '/content/bg-tiles/url-minigame/ponyhead-bay'
  start: x: 1835, y: 910 #Arca start point
  scale: 0.12
  rects: [
    [0 0 1900 200]
    [0 0 350 875]
    [425 425 150 150]
    [765 400 150 150]
    [1165 430 150 150]
    [1100 270 150 150]
    [935 305 150 150]
    [555 280 150 150]
    [400 625 950 250]
    [0 825 70 300]
    [25 950 500 700]
    [575 950 300 275]
    [575 1250 300 300]
    [475 1600 1400 300]
    [1000 1360 150 150]
    [1310 1378 150 150]
    [1500 1312 150 150]
    [1405 1175 150 150]
    [1110 1150 150 150]
    [980 1000 150 150]
    [1320 1040 150 150]
    [1550 982 150 150]
    [1800 950 250 700]
    [1375 500 375 375]
    [1375 250 375 225]
    [1800 150 250 725]
    [1900 850 100 125 \exit]

    [1400 275 325 225 \path:shelbys-shell-museum]
    [70 875 175 75 \path:submarine]
    [425 675 200 250 \path:bread-is-art]
    [675 675 75 250 \path:fine-stink-things]
    [1025 675 300 250 \path:newts-eye-pub]
    [525 1025 400 225 \path:surf-the-web]
    [525 1375 400 225 \path:souvenirs]
    [1350 525 450 325 \path:park]
  ]
}

export flee = {
  map-url: '/content/bg-tiles/url-minigame/flee'
  start: x: 106, y: 760 #Arca start point
  scale: 0.12
  rects: [
    [0 0 250 725]
    [0 800 475 900]
    [425 1650 1200 100]
    [525 1200 200 400]
    [750 1200 700 400]
    [525 800 925 375]
    [300 300 775 425]
    [175 0 1375 250]
    [1125 200 425 325]
    [1125 550 625 175]
    [1500 800 350 900]
    [1800 0 350 900]
    [1575 0 350 525]
    [1525 0 75 125]
    [0 700 100 125 \exit]
    [1075 250 600 300 \enter:flower-power]
    [375 600 240 150 \path:book-bonanza]
    [650 600 175 150 \path:dead-parrots-direct]
    [855 600 150 150 \path:junk-stop]
    [1150 600 225 150 \path:probably-vegetables]
    [1425 600 125 150 \path:mostly-mushrooms]
    [1600 600 125 150 \path:tacky-teapots]
    [275 475 200 150 \path:poster-palace]
    [250 125 250 150 \path:breadisan-bakers]
    [525 125 175 150 \path:boogie-van]
    [750 125 140 150 \path:junk-in-the-trunk]
    [950 125 125 150 \path:tack-trader]
    [1450 1225 250 125 \path:quacks-crystals]
  ]

  buildings:
    flower-power:
      map-url: '/content/bg-tiles/url-minigame/flee-market'
      position: x: 950, y: 50
      start: x: 456, y: 974
      scale: 1/2
      player-scale: 0.8
      rects: [
        [0 0 1200 400]
        [350 350 850 575]
        [0 500 250 850]
        [350 1000 1250 350]
        [1250 0 550 950]
        [1150 0 150 150]
        [200 1150 200 150 \exit]
        [0 350 150 200 \exit]
        [1500 900 150 200 \exit]
        [400 800 75 150 \path:flower-power/davy-cameron]
        [475 800 60 150 \path:flower-power/mushroom]
        [535 800 50 150 \path:flower-power/crystal]
        [585 800 110 150 \path:flower-power/algae]
        [695 800 110 150 \path:flower-power/little-pines]
        [805 800 75 150 \path:flower-power/dandelions]
        [325 950 555 50 \path:flower-power]
        [880 925 350 75 \path:trophy-tent]
      ]
}
