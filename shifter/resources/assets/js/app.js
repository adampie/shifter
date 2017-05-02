
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
import VueLoop from 'vue-loop'

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('dashboard', require('./components/Dashboard.vue'));
Vue.component('shifts', require('./components/Shifts.vue'));
Vue.component('onshift', require('./components/Onshift.vue'));
Vue.component('employees', require('./components/Employees.vue'));

const app = new Vue({
    el: '#app'
});
