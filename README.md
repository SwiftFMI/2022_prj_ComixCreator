# Забавни комикси

Малкия Иванчо обича да чете комикси, но още повече обича да съчинява истории за своите приятели. Понеже не може да рисува добре, често взема картинки от (Dalle)[https://openai.com/api/] и добавя различни коментари. Но за целта винаги използва компютъра си у дома. Всички негови приятели в училище имат страхотни телефони и той си е купил последния модел iPhone и има нуждата от приложение, което да му помогне да създава своите комикци.

Приложението трябва да позволява генерирането на картинки използвайки dall-e api-а и въвеждане на текст. Трябва да има галерия от предефинирани шаблони за комикси, където да може да се използват генерираните картинки и да има възможност за добавяне на текст към комикса. Един комикс може да се състои от една или повече картинки.

Приложението трябва да може да поддържа списък с комикси локално на устройството. Потребителя да може да създава нов комиск или да редактира вече съществуващ.
Комиксите да могат да се споделят и записват като картинки в галерията на телефона.

## Демо
![ComicCreatorDemo](https://user-images.githubusercontent.com/57129022/222514574-a5dd4481-b967-45e9-8f3a-6554e62dfb2f.gif)

# Технически елементи:
* Dall-e API (openai.com/api)
* Различните layout-и на комикси са взети като картинки с прозрачност.
* Списъкът на локалните комикси е реализиран с файл от тип json.
