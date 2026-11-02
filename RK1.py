class Section:
    def __init__(self, id, name):
        self.id = id
        self.name = name


class Document:
    def __init__(self, id, title, pages, section_id):
        self.id = id
        self.title = title
        self.pages = pages
        self.section_id = section_id


class SectionDocument:
    def __init__(self, section_id, document_id):
        self.section_id = section_id
        self.document_id = document_id


sections = [
    Section(1, "Архив"),
    Section(2, "Аналитика"),
    Section(3, "Методология"),
    Section(4, "История")
]

documents = [
    Document(1, "Сборников", 120, 1),
    Document(2, "Архивов", 80, 1),
    Document(3, "Отчётов", 60, 2),
    Document(4, "Инструкция по работе", 40, 3),
    Document(5, "История проекта", 100, 4)
]

section_documents = [
    SectionDocument(1, 1),
    SectionDocument(1, 2),
    SectionDocument(2, 3),
    SectionDocument(2, 1),
    SectionDocument(2, 5)
]

print("Запрос 1:")

for document in documents:
    if document.title.lower().endswith("ов"):
        section = next(
            s for s in sections
            if s.id == document.section_id
        )
        print(document.title, "-", section.name)

print("\nЗапрос 2:")

result = []

for section in sections:
    section_pages = [
        d.pages for d in documents
        if d.section_id == section.id
    ]

    if section_pages:
        average = sum(section_pages) / len(section_pages)
        result.append((section.name, average))

result.sort(key=lambda x: x[1])

for name, average in result:
    print(name, "-", round(average, 2))

print("\nЗапрос 3:")

for section in sections:
    if section.name.startswith("А"):
        print(section.name + ":")

        for link in section_documents:
            if link.section_id == section.id:
                document = next(
                    d for d in documents
                    if d.id == link.document_id
                )
                print("-", document.title)
