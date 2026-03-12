import apiClient from '.'
import type { Client } from '@/types'

export const ClientAPI = {
  async getAll(): Promise<Client[]> {
    const response = await apiClient.get('/clients')
    return response.data
  },
  async getById(id: number): Promise<Client> {
    const response = await apiClient.get(`/clients/${id}`)
    return response.data
  },
  async create(client: Omit<Client, 'id' | 'createdAt'>): Promise<Client> {
    const response = await apiClient.post('/clients', client)
    return response.data
  },
  async update(id: number, client: Partial<Client>): Promise<Client> {
    const response = await apiClient.put(`/clients/${id}`, client)
    return response.data
  },
  async delete(id: number): Promise<void> {
    await apiClient.delete(`/clients/${id}`)
  }
}