import "bootstrap";

require("trix")
require("@rails/actiontext")

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
