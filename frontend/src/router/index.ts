import { createRouter, createWebHistory } from 'vue-router'
import ClientsView from '../views/ClientsView.vue'

const routes = [
  {
    path: '/',
    name: 'clients',
    component: ClientsView
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router