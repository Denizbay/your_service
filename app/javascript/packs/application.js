import "bootstrap";


import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initFlickity } from '../plugins/init_flickity';

initMapbox();

// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initStarRating } from '../plugins/init_star_rating';

initStarRating();




$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  initFlickity()
})
