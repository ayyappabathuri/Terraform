variable "function_app" {
  type = map(object({
    rgname         = string
    location       = string
    stname         = string
    splan          = string 
    ostype         = string
    skuname        = string 
    winname        = string
  }))
}