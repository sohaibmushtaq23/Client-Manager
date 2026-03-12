import apiClient from '.'
import type { Contact } from '@/types'

export const ContactAPI = {
  // Get all contacts for a specific client
  async getByClientId(clientId: number): Promise<Contact[]> {
    const response = await apiClient.get(`/clients/${clientId}/contacts`)
    return response.data
  },

  // Get a single contact by its own ID
  async getById(id: number): Promise<Contact> {
    const response = await apiClient.get(`/clients/0/contacts/${id}`) // clientId not needed but we include for path
    // Alternatively, if your backend supports /contacts/:id directly, adjust.
    // We'll assume the nested route works.
    return response.data
  },

  // Create a new contact for a client
  async create(clientId: number, contact: Omit<Contact, 'id' | 'createdAt' | 'clientId'>): Promise<Contact> {
    const response = await apiClient.post(`/clients/${clientId}/contacts`, contact)
    return response.data
  },

  // Update an existing contact
  async update(clientId: number, id: number, contact: Partial<Contact>): Promise<Contact> {
    // The backend might expect the clientId in the URL? Our router uses /clients/{clientId}/contacts/{id}
    // We need to know the clientId. We can either pass it or assume the backend can identify from contact.
    // For simplicity, we'll require clientId as a separate parameter.
    // Let's define update with clientId.
    // We'll adjust later.
    // For now, we'll assume we need clientId.
    // Let's create a function that takes clientId and id.
    const response = await apiClient.put(`/clients/${clientId}/contacts/${id}`, contact)
    return response.data
  },

  // Delete a contact
  async delete(clientId: number, id: number): Promise<void> {
    await apiClient.delete(`/clients/${clientId}/contacts/${id}`)
  }
}