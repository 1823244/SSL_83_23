﻿////////////////////////////////////////////////////////////////////////////////
// Подсистема "Банки".
//
////////////////////////////////////////////////////////////////////////////////

#Область СлужебныеПроцедурыИФункции

// Выводит оповещение о необходимости обновления классификатора банков.
//
Процедура РаботаСБанкамиВывестиОповещениеОНеактуальности() Экспорт
	РаботаСБанкамиКлиент.ОповеститьКлассификаторУстарел();
КонецПроцедуры

#КонецОбласти
