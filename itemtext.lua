-- Spanish version of the descriptions of the items (the stat lines and the
-- effects: "Accuracy+10", "Additional effect: Poison", "Sword skill +5"...).
--
-- The text of the game is English only; the lines made of stats and effects
-- follow a few fixed forms, so they are translated here by rules. The names
-- that belong to the game (the ones in quotes: "Store TP", "Fast Cast"...),
-- the abbreviations (HP, STR, DEF...), the numbers and the flavour text of
-- the items are left as they are: a line that no rule knows stays in
-- English, so nothing is lost.

local M = {}

local ELEMENT = {
    Fire = 'fuego', Ice = 'hielo', Wind = 'viento', Earth = 'tierra',
    Lightning = 'rayo', Water = 'agua', Light = 'luz', Dark = 'oscuridad',
    Darkness = 'oscuridad',
}

-- The word that follows "skill": weapons, defence and magic.
local SKILL = {
    ['Hand-to-Hand'] = 'combate cuerpo a cuerpo',
    ['Dagger'] = 'daga',
    ['Sword'] = 'espada',
    ['Great Sword'] = 'espada grande',
    ['Axe'] = 'hacha',
    ['Great Axe'] = 'hacha grande',
    ['Scythe'] = 'guadaña',
    ['Polearm'] = 'lanza',
    ['Katana'] = 'katana',
    ['Great Katana'] = 'katana grande',
    ['Club'] = 'maza',
    ['Staff'] = 'bastón',
    ['Archery'] = 'arquería',
    ['Marksmanship'] = 'puntería',
    ['Throwing'] = 'arrojadizas',
    ['Parrying'] = 'parada',
    ['Guarding'] = 'guardia',
    ['Evasion'] = 'evasión',
    ['Shield'] = 'escudo',
    ['Singing'] = 'canto',
    ['Wind instrument'] = 'instrumento de viento',
    ['String instrument'] = 'instrumento de cuerda',
    ['Healing magic'] = 'magia curativa',
    ['Enhancing magic'] = 'magia potenciadora',
    ['Enfeebling magic'] = 'magia debilitadora',
    ['Elemental magic'] = 'magia elemental',
    ['Divine magic'] = 'magia divina',
    ['Dark magic'] = 'magia oscura',
    ['Summoning magic'] = 'magia de invocación',
    ['Blue magic'] = 'magia azul',
    ['Ninjutsu'] = 'ninjutsu',
    ['Geomancy'] = 'geomancia',
    ['Handbell'] = 'campanilla',
    ['Magic Accuracy'] = 'precisión mágica',
    ['Fishing'] = 'pesca',
}

-- The kind of magic ("white magic", "black magic"...) of a scroll.
local MAGIC = {
    white = 'blanca', black = 'negra', blue = 'azul', summoning = 'de invocación',
    ninjutsu = 'de ninjutsu', geomancy = 'de geomancia',
}

-- The kind of magic of a casting time or a duration.
local KIND = {
    Enhancing = 'potenciadora', Healing = 'curativa', Elemental = 'elemental',
    Enfeebling = 'debilitadora', Divine = 'divina', Dark = 'oscura',
    Summoning = 'de invocación', Blue = 'azul', Ninjutsu = 'de ninjutsu',
}

-- Whole lines.
local EXACT = {
    ['Furnishing:'] = 'Mobiliario:',
    ['Functionality:'] = 'Funcionalidad:',
    ['Set:'] = 'Conjunto:',
    ['Latent effect:'] = 'Efecto latente:',
    ['Enchantment:'] = 'Encantamiento:',
    ['Occasionally attacks twice'] = 'A veces ataca dos veces',
    ['Occasionally attacks twice or thrice'] = 'A veces ataca dos o tres veces',
    ['Occasionally attacks three times'] = 'A veces ataca tres veces',
    ['Occ. deals double damage'] = 'A veces causa el doble de daño',
    ['Occ. absorbs damage taken'] = 'A veces absorbe el daño recibido',
    ['Increases critical hit damage'] = 'Aumenta el daño de golpe crítico',
    ['Increases rate of critical hits'] = 'Aumenta la probabilidad de golpe crítico',
    ['Increases Acc./Atk.'] = 'Aumenta Prec./Ataq.',
    ['Inc. Mag. Acc./Mag. Atk.'] = 'Aumenta Prec. mág./Ataq. mág.',
    ["In areas under own nation's control:"] = 'En zonas bajo el control de tu nación:',
    ["In areas outside own nation's control:"] = 'En zonas fuera del control de tu nación:',
    ['Cannot Equip Headgear'] = 'No se puede equipar casco',
    ['Additional effect:'] = 'Efecto adicional:',
    ['Occasionally deals double damage'] = 'A veces causa el doble de daño',
    ['Occ. attacks twice or thrice'] = 'A veces ataca dos o tres veces',
    ['Occasionally attacks for triple damage'] = 'A veces causa el triple de daño',
    ['Decreases movement speed'] = 'Reduce la velocidad de movimiento',
    ['Rare'] = 'Rare',
    ['Ex'] = 'Ex',
}

-- Prefixes of a line: the rest of the line is translated too.
local PREFIX = {
    { 'Set: ', 'Conjunto: ' },
    { 'Latent effect: ', 'Efecto latente: ' },
    { 'Enchantment: ', 'Encantamiento: ' },
    { 'Cannot Equip Headgear ', 'No se puede equipar casco ' },
    { 'Pet: ', 'Mascota: ' },
    { 'Automaton: ', 'Autómata: ' },
    { 'Aftermath: ', 'Aftermath: ' },
    { 'Wyvern: ', 'Wyvern: ' },
    { 'Avatar: ', 'Avatar: ' },
    { 'Reives: ', 'Reives: ' },
    { 'Required Skill: ', 'Habilidad requerida: ' },
    { 'Maximum duration: ', 'Duración máxima: ' },
    { 'Maximum bonus: ', 'Bonificación máxima: ' },
    { 'Capacity point bonus: ', 'Bonificación de capacity points: ' },
    { 'Experience point bonus: ', 'Bonificación de puntos de experiencia: ' },
    { 'Unity Ranking: ', 'Rango de Unity: ' },
}

-- Words and phrases of the stat lines, longest first. Applied outside the
-- quotes only.
local WORDS = {
    { 'Weapon Skill Accuracy', 'Precisión de weapon skill' },
    { 'Ranged Accuracy', 'Precisión a distancia' },
    { 'Ranged Attack', 'Ataque a distancia' },
    { 'Magic Accuracy', 'Precisión mágica' },
    { 'Magic Evasion', 'Evasión mágica' },
    { 'Magic Damage taken', 'Daño mágico recibido' },
    { 'Magic damage taken', 'Daño mágico recibido' },
    { 'Physical Damage taken', 'Daño físico recibido' },
    { 'Physical damage taken', 'Daño físico recibido' },
    { 'Breath Damage taken', 'Daño de aliento recibido' },
    { 'Damage taken', 'Daño recibido' },
    { 'Physical damage limit', 'Límite de daño físico' },
    { 'Magic burst damage', 'Daño de explosión mágica' },
    { 'Magic Critical hit rate', 'Prob. de golpe crítico mágico' },
    { 'Critical hit rate', 'Prob. de golpe crítico' },
    { 'Critical hit damage', 'Daño de golpe crítico' },
    { 'Weapon skill damage', 'Daño de weapon skill' },
    { 'Magic Damage', 'Daño mágico' },
    { 'Spell interruption rate down', 'Reducción de interrupción de hechizos' },
    { 'HP recovered while healing', 'HP recuperados al descansar' },
    { 'MP recovered while healing', 'MP recuperados al descansar' },
    { 'Movement speed', 'Velocidad de movimiento' },
    { 'Resistance to all status ailments', 'Resistencia a todos los estados alterados' },
    { 'Avatar perpetuation cost', 'Coste de mantenimiento del avatar' },
    { 'ability delay', 'retardo de habilidad' },
    { 'Mag. Acc.', 'Prec. mág.' },
    { 'Rng. Acc.', 'Prec. a dist.' },
    { 'Mag. Atk.', 'Ataq. mág.' },
    { 'Rng. Atk.', 'Ataq. a dist.' },
    { 'Mag. Eva.', 'Eva. mág.' },
    { 'Acc.', 'Prec.' },
    { 'Atk.', 'Ataq.' },
    { 'Eva.', 'Eva.' },
    { 'Increases', 'Aumenta' },
    { 'Inc.', 'Aumenta' },
    { 'min.', 'min.' },
    { 'Accuracy', 'Precisión' },
    { 'Attack', 'Ataque' },
    { 'Evasion', 'Evasión' },
    { 'DMG:', 'Daño:' },
    { 'Delay:', 'Retardo:' },
    { 'Max.', 'Máx.' },
}

-- Quoted names ("Store TP") are kept: they are hidden while the words are
-- replaced and put back afterwards.
local function protect(line)
    local saved = {}

    local hidden = line:gsub('"[^"]*"', function(quoted)
        saved[#saved + 1] = quoted

        return '\1' .. #saved .. '\2'
    end)

    return hidden, saved
end

local function restore(line, saved)
    return (line:gsub('\1(%d+)\2', function(index)
        return saved[tonumber(index)]
    end))
end

local function words(line)
    local hidden, saved = protect(line)

    for _, pair in ipairs(WORDS) do
        local from = pair[1]
        local escaped = from:gsub('%p', '%%%0')
        local starts = from:match('^%w') ~= nil and '%f[%w]' or ''
        local ends = from:match('%w$') ~= nil and '%f[^%w]' or ''

        hidden = hidden:gsub(starts .. escaped .. ends, (pair[2]:gsub('%%', '%%%%')))
    end

    return restore(hidden, saved)
end

-- The status or effect an item adds ("Additional effect: Poison").
local EFFECT = {
    Poison = 'veneno', Paralysis = 'parálisis', Sleep = 'sueño', Blind = 'ceguera',
    Silence = 'silencio', Slow = 'lentitud', Stun = 'aturdimiento', Bind = 'ligadura',
    Petrification = 'petrificación', Plague = 'plaga', Curse = 'maldición',
    Haste = 'Haste', Amnesia = 'amnesia', Terror = 'terror', Charm = 'encantamiento',
    Dispel = 'Dispel', ['Weakens defense'] = 'reduce la defensa',
    ['Weakens attacks'] = 'reduce el ataque', ['Drains HP'] = 'drena HP',
    ['Drains MP'] = 'drena MP', ['Absorbs HP'] = 'absorbe HP',
    ['Defense down'] = 'reduce la defensa', ['Attack down'] = 'reduce el ataque',
    ['Evasion down'] = 'reduce la evasión', ['Accuracy down'] = 'reduce la precisión',
    ['Magic Evasion down'] = 'reduce la evasión mágica',
    ['Magic Defense down'] = 'reduce la defensa mágica',
    ['Impairs evasion'] = 'reduce la evasión', ['HP drain'] = 'drena HP',
    ['HP Drain'] = 'drena HP', ['Blindness'] = 'ceguera',
}

local function additional_effect(rest)
    local element = rest:match('^(%a+) damage$')

    if element ~= nil and ELEMENT[element] ~= nil then
        return 'Efecto adicional: daño de ' .. ELEMENT[element]
    end

    if EFFECT[rest] ~= nil then
        return 'Efecto adicional: ' .. EFFECT[rest]
    end

    return nil
end

local function one_line(line)
    local text = line:gsub('^%s+', ''):gsub('%s+$', '')

    if text == '' then
        return line
    end

    if EXACT[text] ~= nil then
        return EXACT[text]
    end

    -- Job levels ("BRD Lv.45") and lines with no words stay as they are.
    local rest

    rest = text:match('^Additional effect: (.+)$')

    if rest ~= nil then
        local done = additional_effect(rest)

        if done ~= nil then
            return done
        end
    end

    rest = text:match('^Additional effect: ("[^"]*")$')

    if rest ~= nil then
        return 'Efecto adicional: ' .. rest
    end

    local quoted, number = text:match('^("[^"]*") potency (.*)$')

    if quoted ~= nil then
        return 'Potencia de ' .. quoted .. ' ' .. number
    end

    quoted, number = text:match('^("[^"]*") potency II (.*)$')

    if quoted ~= nil then
        return 'Potencia de ' .. quoted .. ' II ' .. number
    end

    quoted, number = text:match('^("[^"]*") effect duration (.*)$')

    if quoted ~= nil then
        return 'Duración del efecto de ' .. quoted .. ' ' .. number
    end

    -- Physical damage: "Blaze Spikes" effect
    rest = text:match('^Physical damage: ("[^"]*") effect$')

    if rest ~= nil then
        return 'Daño físico: efecto ' .. rest
    end

    rest = text:match('^Required Crystal: (%a+)$')

    if rest ~= nil and ELEMENT[rest] ~= nil then
        return 'Cristal requerido: ' .. ELEMENT[rest]
    end

    rest = text:match('^Enhances ("[^"]*") effect$')

    if rest ~= nil then
        return 'Potencia el efecto de ' .. rest
    end

    rest = text:match('^Adds ("[^"]*") effect$')

    if rest ~= nil then
        return 'Añade el efecto de ' .. rest
    end

    rest = text:match('^Set: Augments ("[^"]*")$')

    if rest ~= nil then
        return 'Conjunto: potencia ' .. rest
    end

    rest = text:match('^Augments ("[^"]*")$')

    if rest ~= nil then
        return 'Potencia ' .. rest
    end

    local amount = text:match('^Converts (%d+) HP to MP$')

    if amount ~= nil then
        return 'Convierte ' .. amount .. ' HP en MP'
    end

    amount = text:match('^Converts (%d+) MP to HP$')

    if amount ~= nil then
        return 'Convierte ' .. amount .. ' MP en HP'
    end

    local kind, spell = text:match('^Teaches the (%a+) magic (.-)%.?$')

    if kind ~= nil and MAGIC[kind] ~= nil then
        return 'Enseña el hechizo de magia ' .. MAGIC[kind] .. ': ' .. spell .. '.'
    end

    local ability = text:match('^Teaches the (.-) ability$')

    if ability ~= nil then
        return 'Enseña la habilidad ' .. ability
    end

    -- "Sword skill +5 Haste+3%": the weapon or the magic and the rest.
    local skill, tail = text:match('^(.-) skill (.*)$')

    if skill ~= nil and SKILL[skill] ~= nil then
        return 'Habilidad de ' .. SKILL[skill] .. ' ' .. words(tail)
    end

    kind, tail = text:match('^(%a+) magic casting time (.*)$')

    if kind ~= nil and KIND[kind] ~= nil then
        return 'Tiempo de lanzamiento de magia ' .. KIND[kind] .. ' ' .. tail
    end

    kind, tail = text:match('^(%a+) magic duration (.*)$')

    if kind ~= nil and KIND[kind] ~= nil then
        return 'Duración de magia ' .. KIND[kind] .. ' ' .. tail
    end

    kind, tail = text:match('^("[^"]*") spellcasting time (.*)$')

    if kind ~= nil then
        return 'Tiempo de lanzamiento de ' .. kind .. ' ' .. tail
    end

    kind, tail = text:match('^(%a+) spellcasting time (.*)$')

    if kind ~= nil and kind == 'Song' then
        return 'Tiempo de lanzamiento de canciones ' .. tail
    end

    -- A prefix ("Set: ", "Pet: ") and the translated rest.
    for _, pair in ipairs(PREFIX) do
        if text:sub(1, #pair[1]) == pair[1] then
            return pair[2] .. one_line(text:sub(#pair[1] + 1))
        end
    end

    return words(text)
end

local KEPT = {
    'Haste', 'Enmity', 'Afterglow', 'Aftermath', 'Besieged', 'Addendum', 'White', 'Black',
    'Rare', 'Ex', 'Lv', 'Trust', 'Reives', 'Wyvern', 'Avatar', 'Unity', 'Ranking',
    'Dynamis', 'Domain', 'Invasion', 'Incl', 'Pets', 'Avatars', 'Automaton',
}

-- True when a line is only stats, numbers and names (nothing to translate)
-- or has been translated: used to count what the rules cover.
function M.Covered(line)
    local hidden = (protect(line))

    -- What is left once the quoted names, the abbreviations and the numbers
    -- are out: any lower-case word is English text.
    local left = hidden:gsub('\1%d+\2', ''):gsub('%u%u+', '')

    -- Terms of the game that are kept in English.
    for _, term in ipairs(KEPT) do
        left = left:gsub(term, '')
    end

    left = left:gsub('[%d%p]', ' ')

    return left:find('%l%l') == nil
end

-- The description in Spanish: every line the rules know is translated, the
-- other ones stay as they are.
function M.Translate(text)
    if type(text) ~= 'string' or text == '' then
        return text
    end

    local out = {}

    for line in (text .. '\n'):gmatch('(.-)\n') do
        out[#out + 1] = one_line(line)
    end

    return table.concat(out, '\n')
end

return M
