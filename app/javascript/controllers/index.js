// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

//controllerフォルダ内にあるすべての_controller.jsファイルを自動的に読み込んでくれる関数
eagerLoadControllersFrom("controllers", application)
