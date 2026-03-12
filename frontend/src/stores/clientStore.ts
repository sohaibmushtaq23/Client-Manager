import { defineStore } from 'pinia'
import { ref } from 'vue'
import { ClientAPI } from '@/api/client'
import type { Client } from '@/types'

export const useClientStore = defineStore('client', () => {
  const clients = ref<Client[]>([])
  const selectedClient = ref<Client | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchClients() {
    loading.value = true
    error.value = null
    try {
      clients.value = await ClientAPI.getAll()
    } catch (err) {
      error.value = 'Failed to load clients'
      console.error(err)
    } finally {
      loading.value = false
    }
  }

  async function createClient(clientData: Omit<Client, 'id' | 'createdAt'>) {
    loading.value = true
    error.value = null
    try {
      const newClient = await ClientAPI.create(clientData)
      // Option 1: add to local list (optimistic)
      clients.value.push(newClient)
      // Option 2: refetch all (simpler, ensures consistency)
      // await fetchClients()
      return newClient
    } catch (err) {
      error.value = 'Failed to create client'
      throw err
    } finally {
      loading.value = false
    }
  }

  // async function updateClient(id: number, clientData: Partial<Client>) {
  //   loading.value = true
  //   error.value = null
  //   try {
  //     await ClientAPI.update(id, clientData) // No response body expected
  
  //     // Update the local list with the data we sent (optimistic update)
  //     const index = clients.value.findIndex(c => c.id === id)
  //     if (index !== -1) {
  //       // Merge the changes into the existing client object
  //       clients.value[index] = { ...clients.value[index], ...clientData }
  //     }
  
  //     // If this client is currently selected, update the selectedClient as well
  //     if (selectedClient.value?.id === id) {
  //       selectedClient.value = { ...selectedClient.value, ...clientData }
  //     }
  
  //     // Note: We're not returning anything, but the component may not need it.
  //     // If you need to return the updated client, you could fetch it again or construct it.
  //   } catch (err) {
  //     error.value = 'Failed to update client'
  //     throw err
  //   } finally {
  //     loading.value = false
  //   }
  // }

  async function updateClient(id: number, clientData: Partial<Client>) {
    loading.value = true
    error.value = null
    try {
      const updated = await ClientAPI.update(id, clientData)
      console.log('Updating client, response:', updated)
      // Update in local list
      const index = clients.value.findIndex(c => c.id === id)
      if (index !== -1) {
        clients.value[index] = updated
      }
      // If this is the selected client, update selectedClient
      if (selectedClient.value?.id === id) {
        selectedClient.value = updated
      }
      return updated
    } catch (err) {
      error.value = 'Failed to update client'
      throw err
    } finally {
      loading.value = false
    }
  }

  async function deleteClient(id: number) {
    loading.value = true
    error.value = null
    try {
      await ClientAPI.delete(id)
      // Remove from local list
      clients.value = clients.value.filter(c => c.id !== id)
      // If deleted client was selected, clear selection
      if (selectedClient.value?.id === id) {
        selectedClient.value = null
      }
    } catch (err) {
      error.value = 'Failed to delete client'
      throw err
    } finally {
      loading.value = false
    }
  }

  function selectClient(client: Client | null) {
    selectedClient.value = client
  }

  return {
    clients,
    selectedClient,
    loading,
    error,
    fetchClients,
    createClient,
    updateClient,
    deleteClient,
    selectClient
  }
})