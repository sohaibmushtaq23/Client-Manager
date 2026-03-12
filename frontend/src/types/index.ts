export interface Client {
    id: number
    clientCode: string
    companyName: string
    industry: string
    email: string
    phone: string
    website: string
    country: string
    city: string
    address: string
    isActive: boolean
    creditLimit: number
    createdAt: string
  }

  export interface Contact {
    id: number
    clientId: number      // matches IDClient in backend
    firstName: string
    lastName: string
    designation?: string | null
    email?: string | null
    mobile?: string | null
    gender?: string | null
    birthDate?: string | null  // we'll use string in ISO format
    isPrimary: boolean
    notes?: string | null
    createdAt: string
  }