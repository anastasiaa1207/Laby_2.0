// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", function() {
    let form = document.getElementById("form");
    let res_div = document.getElementById("result");
    let get_result = async function() {
        let number = document.getElementById("input").value;
        let action_url = "result?number=" + number;
        let response = await fetch(action_url);
        if (response.ok) {
            res_div.innerHTML = await response.text();
        } else {
            alert("Ошибка HTTP: " + response.status);
        }
    }

    form.addEventListener("submit", function(event) {
        event.preventDefault();
        get_result();
    })
})
