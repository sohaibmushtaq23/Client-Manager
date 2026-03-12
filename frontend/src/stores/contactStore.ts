import { defineStore } from 'pinia'
import { ref } from 'vue'
import { ContactAPI } from '@/api/contact'
import type { Contact } from '@/types'

export const useContactStore = defineStore('contact', () => {
  const contacts = ref<Contact[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchContactsByClient(clientId: number) {
    loading.value = true
    error.value = null
    try {
      contacts.value = await ContactAPI.getByClientId(clientId)
    } catch (err) {
      error.value = 'Failed to load contacts'
      console.error(err)
    } finally {
      loading.value = false
    }
  }

  async function createContact(clientId: number, contactData: Omit<Contact, 'id' | 'createdAt' | 'clientId'>) {
    loading.value = true
    error.value = null
    try {
      const newContact = await ContactAPI.create(clientId, contactData)
      contacts.value.push(newContact)
      return newContact
    } catch (err) {
      error.value = 'Failed to create contact'
      throw err
    } finally {
      loading.value = false
    }
  }

  async function updateContact(clientId: number, id: number, contactData: Partial<Contact>) {
    loading.value = true
    error.value = null
    try {
      const updated = await ContactAPI.update(clientId, id, contactData)
      const index = contacts.value.findIndex(c => c.id === id)
      if (index !== -1) {
        contacts.value[index] = updated
      }
      return updated
    } catch (err) {
      error.value = 'Failed to update contact'
      throw err
    } finally {
      loading.value = false
    }
  }

  async function deleteContact(clientId: number, id: number) {
    loading.value = true
    error.value = null
    try {
      await ContactAPI.delete(clientId, id)
      contacts.value = contacts.value.filter(c => c.id !== id)
    } catch (err) {
      error.value = 'Failed to delete contact'
      throw err
    } finally {
      loading.value = false
    }
  }

  function clearContacts() {
    contacts.value = []
  }

  return {
    contacts,
    loading,
    error,
    fetchContactsByClient,
    createContact,
    updateContact,
    deleteContact,
    clearContacts
  }
})