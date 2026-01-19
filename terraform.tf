terraform { 
  cloud { 
    
    organization = "healthy-organ" 

    workspaces { 
      name = "ghactions1" 
    } 
  } 
}
