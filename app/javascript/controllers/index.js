// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import "@hotwired/turbo-rails"
import "./controllers" 
import "bootstrap"
window.bootstrap = bootstrap;
eagerLoadControllersFrom("controllers", application)
