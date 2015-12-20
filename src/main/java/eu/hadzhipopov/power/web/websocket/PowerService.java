package eu.hadzhipopov.power.web.websocket;

import eu.hadzhipopov.power.domain.PowerHistory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class PowerService {

    private static final Logger log = LoggerFactory.getLogger(PowerService.class);

    @SendTo("/topic/power")
    public PowerHistory sendPower(PowerHistory powerHistory) {
        log.debug("Sending power data {}", powerHistory);
        return powerHistory;
    }
}
