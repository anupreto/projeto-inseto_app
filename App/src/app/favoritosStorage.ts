import AsyncStorage from '@react-native-async-storage/async-storage';

const CHAVE_FAVORITOS = '@wiki_invertebrados:favoritos_ids';

export async function obterFavoritosIds(): Promise<number[]> {
  try {
    const bruto = await AsyncStorage.getItem(CHAVE_FAVORITOS);
    if (!bruto) return [];
    const parsed = JSON.parse(bruto);
    if (!Array.isArray(parsed)) return [];
    return parsed
      .map((item) => Number(item))
      .filter((id) => Number.isFinite(id) && id > 0);
  } catch {
    return [];
  }
}

export async function salvarFavoritosIds(ids: number[]): Promise<void> {
  const unicos = Array.from(
    new Set(ids.map((id) => Number(id)).filter((id) => Number.isFinite(id) && id > 0))
  );
  await AsyncStorage.setItem(CHAVE_FAVORITOS, JSON.stringify(unicos));
}

export async function alternarFavoritoId(idInseto: number): Promise<number[]> {
  const atual = await obterFavoritosIds();
  const existe = atual.includes(idInseto);
  const proximo = existe ? atual.filter((id) => id !== idInseto) : [...atual, idInseto];
  await salvarFavoritosIds(proximo);
  return proximo;
}
