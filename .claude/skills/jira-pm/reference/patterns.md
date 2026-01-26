# Agile & Jira Specification Patterns

## 1. INVEST Criteria for User Stories
Um bom User Story deve seguir o acrônimo INVEST:

*   **I - Independent (Independente):** Deve ser possível desenvolvê-la e entregá-la separadamente de outras histórias.
*   **N - Negotiable (Negociável):** Não é um contrato fechado; é um convite para o diálogo. Os detalhes podem mudar.
*   **V - Valuable (Valiosa):** Deve entregar valor claro para o cliente ou usuário final.
*   **E - Estimable (Estimável):** O time deve conseguir estimar o tamanho/complexidade. Se for muito grande, quebre-a.
*   **S - Small (Pequena):** Deve caber dentro de uma iteração (Sprint).
*   **T - Testable (Testável):** Deve ter critérios claros para dizer "está pronto".

## 2. BDD & Gherkin for Acceptance Criteria
Use a sintaxe Gherkin para descrever comportamentos esperados. Isso serve como documentação viva e base para testes automatizados.

**Estrutura Básica:**
*   **Given (Dado que):** O contexto inicial ou pré-condição.
*   **When (Quando):** A ação executada pelo usuário ou evento do sistema.
*   **Then (Então):** O resultado esperado ou mudança de estado.
*   **And/But (E/Mas):** Para adicionar condições extras.

**Exemplo:**
```gherkin
Scenario: Transferência com saldo insuficiente
  Given que tenho R$ 50,00 na conta
  When tento transferir R$ 100,00 para João
  Then a transferência deve ser bloqueada
  And devo ver a mensagem "Saldo insuficiente"
```

## 3. Jira Issue Types Hierarchy

| Tipo | Descrição | Quando usar |
|------|-----------|-------------|
| **Epic** | Grande corpo de trabalho. Pode durar várias sprints. | Projetos completos, módulos inteiros, grandes features. |
| **Story** | Funcionalidade entregável de valor para o usuário. | Features específicas, melhorias de UX. |
| **Task** | Tarefa técnica que não entrega valor direto ao usuário final, mas é necessária. | Atualização de servidor, refatoração interna, setup de ambiente. |
| **SubTask** | Passo técnico para completar uma Story ou Task. | "Criar migration", "Desenhar tela", "Escrever teste unitário". |
| **Bug** | Algo que funcionava e parou, ou não funciona como especificado. | Defeitos, erros, falhas. |
