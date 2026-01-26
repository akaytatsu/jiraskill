# Epic: Sistema de Autenticação Seguro

## Business Objective
Implementar um sistema de autenticação robusto e seguro para permitir que os usuários acessem a plataforma, protegendo dados sensíveis e cumprindo requisitos de compliance (LGPD).

## Key Capabilities
- Cadastro de novos usuários (Sign Up)
- Login com Email/Senha (Sign In)
- Recuperação de Senha (Forgot Password)
- Logout seguro

## Success Metrics
- Taxa de sucesso de login > 99%
- Tempo médio de login < 500ms
- Redução de chamados de suporte por "senha esquecida" em 30%

---

## Child Story 1: Login com Email e Senha (PROJ-101)

**User Story:**
As a **User**, I want to **log in with my email and password**, so that I can **access my private dashboard**.

**Acceptance Criteria:**

```gherkin
Scenario: Login com sucesso
  Given que estou na tela de login
  When informo um email válido registrado
  And informo a senha correta
  And clico em "Entrar"
  Then devo ser redirecionado para a Home
  And um token JWT válido deve ser armazenado

Scenario: Login com senha incorreta
  Given que estou na tela de login
  When informo um email válido
  And informo uma senha incorreta
  And clico em "Entrar"
  Then devo ver uma mensagem de erro "Credenciais inválidas"
  And continuo na tela de login
```

### SubTasks para PROJ-101:
1. **[Backend] Criar endpoint POST /auth/login**: Receber credentials, validar hash, gerar JWT.
2. **[Frontend] Implementar tela de Login**: Criar form com validação e integração com API.
3. **[QA] Testes de Integração**: Testar fluxos de sucesso e erro.
