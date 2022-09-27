package site.metacoding.red.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.red.domain.player.Player;
import site.metacoding.red.domain.player.PlayerDao;
import site.metacoding.red.web.dto.player.PlayerInsertReqDto;
import site.metacoding.red.web.dto.player.PositionListDto;

@RequiredArgsConstructor
@Service
public class PlayerService {
	
	private final PlayerDao playerDao;

	public List<Player> 목록보기(){
		return playerDao.findAll();
	}
	
	public void 선수등록(PlayerInsertReqDto playerInertReqDto) {
		playerDao.insert(playerInertReqDto.toEntity());
	}
	
	public void 선수삭제(Integer id) {
		playerDao.deleteById(id);
	}
	public List<PositionListDto> 포지션별선수목록보기(){
		return playerDao.findAllPevot();
	}
}
